Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E88C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 15:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1QO5SCpQ8AqJrVfLyuS9U9W3JEEJTUZ72Ub2BUfEdo=; b=lZPNPqgstdoO2Mws38IGR8ubEB
	TA3gvozwtammD1ghVBP6QzYjLFI+KEXVSCxtnPTiCgde+IRftRjspzu6WhdCaMHaDWpGA2jzGltci
	N2Hk6W9CE5O3dwGRLNEChPSzsFaysCUVahSsqL5jQZKMOTXkXIXW9ae34Ocs9aVzSVt1KsiOLWdqv
	de1XzsdAEVHXropPWdQ+5nxKg7RE1BiPzSzr3pJ11a7xLGo50TjoxPR7BGLCtbY/w2Ba2/bFltJmU
	gHnRf+235paaxzpHd60UROV2XnSUjwZ/BdknwOit9aS74vbEz6eozWsw7GyWWTiIi47qmKsJIBuP+
	wC445BvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taFur-00000008BIv-0YFD;
	Tue, 21 Jan 2025 15:11:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taFrW-00000008AdZ-15L8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 15:08:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49285A41A10;
	Tue, 21 Jan 2025 15:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A214C4CEDF;
	Tue, 21 Jan 2025 15:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737472096;
	bh=g1QO5SCpQ8AqJrVfLyuS9U9W3JEEJTUZ72Ub2BUfEdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMKUtvAliXgips3CGbLmM8bekWXvkQlo2qjXoZn1gT8j9c3+uUJbIavcSnynMTgZJ
	 rCR0L+ffd1F4D+BK1MDuyyWf7pRQny3Wyey8Lfs5VCGrRboDjJf5cHxCV9fQ3egOew
	 JGwqEru1gmidpzev2o9Hgxr0HmVwacHMXw7rlE8w=
Date: Tue, 21 Jan 2025 10:08:12 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v11 0/7] v12: firmware: imx: driver for NXP secure-enclave
Message-ID: <20250121-military-helpful-polecat-9ba567@lemur>
References: <20250120-imx-se-if-v11-0-4d7d8f7f4b56@nxp.com>
 <AM9PR04MB8604228D1E99ECB45F8E0BAB95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AM9PR04MB8604228D1E99ECB45F8E0BAB95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_070818_363210_E8E0E47F 
X-CRM114-Status: UNSURE (   8.32  )
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

On Mon, Jan 20, 2025 at 09:18:11AM +0000, Pankaj Gupta wrote:
> Ran "b4 send --reflect"
> But it sent to all.

I don't believe it did, at least not judging from the archives:
https://lore.kernel.org/all/20250120-imx-se-if-v11-0-4d7d8f7f4b56@nxp.com/

Note, that --reflect will populate the "To" and "Cc" message headers, but
won't actually send mail to those addresses.

However, if you think you found a bug in b4, please report it to
tools@kernel.org.

Regards,
-K

