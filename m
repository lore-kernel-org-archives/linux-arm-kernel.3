Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F83C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 05:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyrDWPleKUSXSyI9bInAh54va2B9IwbkO5nZdOK0IsE=; b=4azbJK18XlektixNQZaV/sewwm
	EXlRioOKR6yZ9qXys1FFgkq+3Uc68Yzd5dcQVvOHqhoBegUF61cONO1TXU+SsqgVJeymoRm6qDSLY
	quqD5FRjf3He6mflPAT8BHbNSOK8rt/JyhBqk6U7hfFA12zkgzQvz3hpwpTmGDiUK2bRtdNgx8X3m
	y1+w3YboQP72EKyGVjQqwLeHkYaofluZQvVv0tJXYWQrMGnY8gtkQvgMqNo9AIS6MsGcAL+udHIuY
	WYOPIXqvTqMHKdmr/Wjc8Uk+2pWGDikUHjyZ9ZSv4RonSfmdk2y8n0gzUcmQ8YVWInpXSLo41FLXH
	4+bn6cJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgz4s-0000000FIu8-3dOB;
	Sat, 17 Jan 2026 05:42:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgz4r-0000000FIto-0MaW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 05:42:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 32C9860127;
	Sat, 17 Jan 2026 05:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3D1C4CEF7;
	Sat, 17 Jan 2026 05:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768628543;
	bh=bwlkfXsLFvt1yMomv6AquM31sE55b0EH0gvYr8WZzms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rTGYgQvIkJWzeGmn4+Li1EgCuHH5sDjQ+TCKichzFVNRD9DHexoXGZctijM5n6aYy
	 E12la7VKZhswF73Y4TAVO0w6YITesx7mQlehrWGvtTtzZTFxbjW/skXJyxINVrXfGa
	 fmZS85gcfzVNPLJMoDMLBob8wS/Deiw0qozb7Z7djI5GXQt+eKVyonAK9FfY6cfJTZ
	 02DtGKJtxtNrpPp9xfG4729ffZPSRbeap3egfkVQIKeLPodm7UDpAKFLCaHBzbNFx8
	 zZ01i+iwPtrT8O+k4OFsEkphFvaT/JK6iESKgMD6sZY/rDaL8AGMiFr7YulpIg5g5H
	 osKBQlrfpQu4A==
Date: Sat, 17 Jan 2026 13:42:16 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH v23 0/7] firmware: imx: driver for NXP secure-enclave
Message-ID: <aWshOMxbdqOI9KA9@dragon>
References: <20251219-imx-se-if-v23-0-5c6773d00318@nxp.com>
 <AM9PR04MB860402EC5CB2FB8FC1A34287958FA@AM9PR04MB8604.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM9PR04MB860402EC5CB2FB8FC1A34287958FA@AM9PR04MB8604.eurprd04.prod.outlook.com>
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

On Wed, Jan 14, 2026 at 08:38:44AM +0000, Pankaj Gupta wrote:
> Hi Shawn,
> 
> If there are no new comments.
> Requesting to consider this patch-set to be merged to mainline.

Hmm, it seems that kernel test robot has complaints on patch 3/7?

Shawn

