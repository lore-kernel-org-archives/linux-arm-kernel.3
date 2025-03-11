Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D72AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 22:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=his0IKP3G2YE2g9xL/0UZuK4PEM36vkDrW6qf2IkKoE=; b=VXG8kctaSRHH3Kw3MV29jH+t2Q
	+OYhJWxuwc3H5+l2sMdXImR7Sby72d3sYnJ6/pZzPXaNQubT+i6Q12qYIzlf0uNFnz2cogJQpcp6w
	CbY6sHo8Jd92KHo94BmPgQoMITkOz3g+2RROE5jHNNE6IAciaUC8mTpGm0y3QxWYjHZ6SswhpPCyY
	QJ3TP+odORaFWzHlZ+tAtMDl22E6KAwOKtymmXbAaHc2c1KeJ5s6xr1NxcsPimahppQh+nkptOJFr
	R9e31RMOTacfRc/R0c5y8YvVY3z17NAdHjuakxAQUyqtmE0bGGfFvpwRE+9/JngjwcyD9Y+rDDztI
	f8MaIfpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts7ul-000000075aN-03EJ;
	Tue, 11 Mar 2025 22:17:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts7t6-000000075Pb-2vBf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 22:15:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B23F25C5F5B;
	Tue, 11 Mar 2025 22:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6D5C4CEEA;
	Tue, 11 Mar 2025 22:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741731347;
	bh=SRFNaVjROWG5Dt9gNTjWV0ukYRS5OSkz9zoqD9zJvQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nkc5t/z7RY2QR5Ik5Tg1u8IdSsNhnI7b9xV/r1LDicUHJVDUabklDzPXoQ2m4PJMO
	 8+pMJfQewardsCgHqZHUOWFO887YZcqN7DNWE1LJsbradfwyBDg2m4+e6zSQy3EUxb
	 3sD3ccIyer3qnYxuljxjpyKH4AUqXnJ1ygKZRmSai15iYHky9jSBYDFqexYtsUjOu6
	 ezfVKGvL2ra4m8g8+0mJd1nasX+bgDrFHdjMvT0le0i7hOUMos107eoz5nBwIxzdL/
	 xK/HWJfxfyVXrDpTw6oVzZ8CdEQH6EF4L+jkdys6Lndh+RywDb2vJY81GDIH71Uesw
	 +ZkIltjpXPgUg==
Date: Tue, 11 Mar 2025 23:15:38 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:FREESCALE IMX LPI2C DRIVER" <linux-i2c@vger.kernel.org>, "open list:FREESCALE IMX LPI2C DRIVER" <imx@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: i2c: imx-lpi2c: add i.MX94 LPI2C
Message-ID: <oyjjcxuqki47gruavd2ms5lc4z2mawbdwjd2mwwxss2tq2xqm5@m2ztzpibjrkv>
References: <20250306155815.110514-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306155815.110514-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_151548_787424_BF5E1727 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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

Hi,

On Thu, Mar 06, 2025 at 10:58:15AM -0500, Frank Li wrote:
> Add compatible string "fsl,imx94-lpi2c" for the i.MX94 chip, which is
> backward compatible with i.MX7ULP. Set it to fall back to
> "fsl,imx7ulp-lpi2c".
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi

