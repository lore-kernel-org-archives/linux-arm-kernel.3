Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E067E95391
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 12:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioG9uYV0HuJP9D1DgqNAsKhOMqjhdFQVQ0SW047PMUE=; b=ADTnyBYyE6co0vr38iHpTTeEIo
	AmN7jzNsnGo6ZoIU65ZNiUYMIX+L7osMyJq9/tZ0DEMhsRp4feBKd6f9IXJJW0JfuR513QG7t69ra
	vyArw3xJVmicRnm2ATWQ1WlPmelxaPRPhcJtkCGJZnWiVcR3muQNk1xwavHKikmI+DIHABLCL9bid
	2feu+GNcDHd69p4Pgrmq+bfKUAbVyAYmc+i3zwSD1p3gG/BCDzkGhieBneURIC+loK2PYIB2vayag
	aIclBLwU97euoQKCvp2AKcyjbNC/vlj4ObhMpl2JWPcAfMvZbT+U4HFm+ddnHIwvxLJW9eGqAiqmH
	6Xfb97iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnbgH-00000008Pck-3k6U;
	Wed, 04 Feb 2026 12:08:25 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnbgF-00000008Pbv-14kV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 12:08:24 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-43596062728so577321f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 04:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770206901; x=1770811701; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ioG9uYV0HuJP9D1DgqNAsKhOMqjhdFQVQ0SW047PMUE=;
        b=kWBrcRz4rI0h9D/JomycvJ2ZeBqT8srstgnd0SXUkkz9Gv4gOezujP2d2YPhdvdhbd
         hxK8G/Z2KR99pSOSI49zcczOkVnaYNthR2MJhcxP2Jyhk9Zq5D4sONFLyMA2mqvQ7OUZ
         PYLAugaUnmeiSjXLvrOB0sUJ+evklZlLcLfsbqaQBcYaVmzjpFxbpCqvo7c5xxHVBETI
         az/rCpq64WYvQAnhq2Ym0/vCThk44+FCDOOs8//4W+aT0T4TVsbhA0ya9JHDrHAWOpH1
         Q28gbubkMiWazGrYXK2PClJ6YgyNc7DvNMyrVx/EgIhnkRSah4d43oPVk5oLvwZh7xrU
         ukOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770206901; x=1770811701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioG9uYV0HuJP9D1DgqNAsKhOMqjhdFQVQ0SW047PMUE=;
        b=uLrhe/LWlh6SOI0gVx9E93+LPX5d5GVPzTcmvF8fbOUTl9dUABz/tgoJufRQyvnNss
         7gEzEzVQdlyD9cIb2hXP8aGiTkskBVbAxkm598LvFj7XMBYB04bMLbwzwbVYGe+WroFl
         04vgt4167Ya1LNxXBfWzYGC4b1yGaR9NxW6dBY/cce1psPa2l4+lfSHgG10NDpyczahU
         Ytz+1RQwClVbe4REWQy5v0g32pP/upwJEbsZ3qBi/1tuA6FyZzRkVZLvMnhlZnA+77N1
         P8/xPleScrXOuwQb2bVASlA+EUBaJ6Xkz5sfzU+Pysp2TZHoQKB7mezOk5Xgf93ih4ZN
         TKeg==
X-Forwarded-Encrypted: i=1; AJvYcCUy2gjKLODAr/uZ43hdOgGhe8KcGIlWn/BMR/qIe8ZeGfgRaBBN6pk0jx/znI2NsC+m9+1ygtS1jhxAtqz9ljYj@lists.infradead.org
X-Gm-Message-State: AOJu0YzQTNu0fB83++8F5AdalwPKLeRbiKxHR8ODFiB+7dStFM4IeXkK
	x/QLjK3zB/0gJcThTn1IVzLgPVn+yCLhg/G2ymQ2DlzN+g+EP3lI3cVn7WQVEfzJ7vU=
X-Gm-Gg: AZuq6aLOt6x/1Xlb06g+tHx3fjJ72WAJ2XA9gvkXH4WRyvvY7hGPtLFUs8X4PsSs2zN
	+ncMKtCZkWuZNS4Zf7qd90gX6IlJdNawqWZ0m9uU0z6ZRx4EuRNqB8Y6TIy9pNGXlZIkCNyNTc+
	QrA9zWfHwddWrHqC2L1xjT2zvKX3QO8Z7Ev8sLgMHZZFZ1AL3/wXMHinYB3rNKTgtTFEtNy6GC9
	RBBfathec/6vcDuDIVTlHr4izIVca8bTWW9VwKtwbzjZJkYHJ44RsVNqv2a3LOJvwnmUCxQGbso
	VkeXxu2AghvYeLZEggYcB/3wwcU2oXG1abLpB+YZELKdE5GC+nHz8jBd51Lnq3OWP22EXICsJYP
	PAONaH61l2VbGL+DabiFBbgpQWUf8KrBZ2/lURq7AlHLi72aeIxyo7WdIAPNwB4+4GrA//lPPap
	Pgu5wLVsQxxoDtJ1IdeR96Ey3b5LA=
X-Received: by 2002:a05:6000:288a:b0:435:92c6:d556 with SMTP id ffacd0b85a97d-43617c84202mr4190603f8f.16.1770206901187;
        Wed, 04 Feb 2026 04:08:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f7csm5851345f8f.23.2026.02.04.04.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 04:08:20 -0800 (PST)
Date: Wed, 4 Feb 2026 15:08:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Chester Lin <chester62515@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Jan Petrous <jan.petrous@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, linaro-s32@linaro.org
Subject: Re: [PATCH v6 0/3] s32g: Use a syscon for GPR
Message-ID: <aYM2sXq2FXCISrCI@stanley.mountain>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
 <bdb7cd69-7dcd-4e8a-b04a-14a2eb902311@redhat.com>
 <20260203145438.5a850b61@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203145438.5a850b61@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_040823_331637_57C2D34C 
X-CRM114-Status: GOOD (  16.81  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Feb 03, 2026 at 02:54:38PM -0800, Jakub Kicinski wrote:
> On Tue, 3 Feb 2026 12:18:54 +0100 Paolo Abeni wrote:
> > It looks like patch 3/3 depends on 1/3 but it should land in a different
> > tree, as patches 1 && 2 looks suitable for 'net-next' and 3/3 should
> > probably go via the arm/freescale tree.
> > 
> > We either need explicit ack from freescale maintainers or this should be
> > split across subtrees, right?
> 
> FWIW normally we don't touch the dts patch at all, unless the
> maintainer chimes in and tells us to take it. No waiting for acks.
> Off the top of my head us taking dts patches only happens if 
> the person posting the patch _is_ the platform maintainer..
> 
> For this series we're waiting for the bindings to be reviewed.

Ugh.  Crap.  Rob already reviewed them.  I included his Reviewed-by tag
in v5 but I accidentally removed it that from v6.  I'm so sorry.

https://lore.kernel.org/all/939fdaf94038613486bdbba510a92a1e57e18c71.1769592679.git.dan.carpenter@linaro.org/

regards,
dan carpenter

