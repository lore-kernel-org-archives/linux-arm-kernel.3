Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C35ACCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fpXvJaxUezX/qrHlm1Wc2qpJNkfgp6lz8sBDtu/HNk=; b=vRRZ/br95QNyuMZ8o8V15NOhgC
	Q21ZLIi/4+DytIoVfXRr6B54HXivew26VopyybYFWAwHQMC+4H/S8l3/FVtOu55lYcQMWcbd8IVi8
	QSrHbK+3UH2aW/SLIXoge1B1V8zWzzcVUkln8H1gxe55IiY/M+wqVtZaYA9xyQcbh9q+8bXQiBPWB
	gDD5Ghe5ytWuRSE7e6geTu5ouHmbK55nHr9bu+C+6CMctG0w/Zt+0sv4JBIFH4feHhMoTnckTtzFB
	P8EKz656TSQ+LLsNFtQtQpMepMAC133wWliSkOf0gH8LXrSYuursLjZgzAjJvSdXnBR/vS9i8FA4l
	QfGrMMNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5vD-00000001IEu-1aWM;
	Wed, 29 Oct 2025 13:09:03 +0000
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5v5-00000001I5s-13WC;
	Wed, 29 Oct 2025 13:08:56 +0000
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4cxSH81sV3z49Q8y;
	Wed, 29 Oct 2025 15:08:36 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1761743318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9fpXvJaxUezX/qrHlm1Wc2qpJNkfgp6lz8sBDtu/HNk=;
	b=jk5xCZs2MhJ6YV0WbgnrB6KrYUYYgRll8qz+FZ0cYkqAiYwipqdWCnAi6lyXbGAZcJXqkE
	KzDf7WdkZ4Iil8qEkO9Rz/rPuLBO6YvqlFb56rpGJMSJq+/15HEcSsgVSBnaQewQF6j/YD
	9Vs2D2q2ZrW4d9BFtKP7GhX41Z0ogUZ3jDjgyeZGOV5w7qhB4VQOATBWZxVgKuEqDCRbbr
	v/YbFWdKeJw2aelyObzMQcIhHElcISRvozrd/pMfl2NAWfFn06fZvCFmg48TdXV1myVQsD
	Z2rU78zR5OPZvPkt/jnSj3MPAbvf62u7dQn4Jcq3iEY8Hu6LQy5PPOhZX1T8xQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1761743318; a=rsa-sha256;
	cv=none;
	b=tp2biwcG6TD4/1R1UJK1dPWB2mg9cHYaQB4U6s/t9jQe6+JFUsF4XZJblE6aur/0DJZcwm
	sxHFlwGztav721qoQBihahfdm/bprdIKl0SsWrzjp4p2vC768v7P6WcZX8iPqlEg9PTpoe
	AdnWDL/aA779EiDbvnxlFXmArGpmdeoC20MUXO8YP/GNZTN090o8SfrfT8oJjMQYnI2rgw
	QjuIwNcT1W6Zw5HV6w67EFWLpNrgr6FxjQddSzH4aMhF0MCDivo54T4BcOw90I/ov+WEhf
	rPwboAeQbaeJQUckruhackPuZIzNAououq6TDhhZR3kAA/8Uh5FRR6q60M2mgQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1761743318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9fpXvJaxUezX/qrHlm1Wc2qpJNkfgp6lz8sBDtu/HNk=;
	b=ZvkgpX/FQ74zH8z7fM/WHCxsFU2vxWamDQJB/eW9eTWdtg1Psy+HGlAbjiCL0YMI4te1Td
	bgPPKLFWpKUpicreBmdu8Q42vBg+DsQm9nbe36xlwTxxtenKkyvDdmIsOIvVAX5Tj1bWjW
	NHqvQoEGys9BagIJhTLOr90fNNaodI+5ZIPvTuJYyzNRcteEGqVIlaY/ptmbb0PNMLPP4I
	jUdut+KtbNgnKmFmqfDwxDUjmqNQjujY3sbIe2lQhng9SOJocg6gIYnkn2pP6AREw74YJ6
	3dko+PeZACZS5t4NZa8q+Z0d8qWegf7KCwZp7CmDpwOawFYioXLbd8y1XknteA==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B6E39634C50;
	Wed, 29 Oct 2025 15:08:35 +0200 (EET)
Date: Wed, 29 Oct 2025 15:08:35 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 03/31] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_(bpp|dt)()
Message-ID: <aQIR03RD0BekWkmX@valkosipuli.retiisi.eu>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-3-c9286fbb34b9@nxp.com>
 <aP81s4FDhj0-3WFh@valkosipuli.retiisi.eu>
 <aP+isGnWmJ4tLXcs@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP+isGnWmJ4tLXcs@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_060855_767207_079AEF54 
X-CRM114-Status: GOOD (  14.93  )
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

Hi Frank,

On Mon, Oct 27, 2025 at 12:49:52PM -0400, Frank Li wrote:
> On Mon, Oct 27, 2025 at 11:04:51AM +0200, Sakari Ailus wrote:
> > > +/* DT value ref to MIPI Camera Serial Interface 2 Spec Ver4.1 section 9.4 */
> >
> > I'm not sure if I'd add such a reference here. At least it shouldn't be in
> > this patch.
> 
> Still not in v6.18-rc3. I add comments in this patch because try to add
> media_bus_fmt_to_csi2_dt().
> 
> If dt define is not standard, media_bus_fmt_to_csi2_dt() don't make sense.
> the difference vendor choose difference dt values.
> 
> I am fine create patch for it before this one.

Sounds good to me.

-- 
Sakari Ailus

