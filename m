Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7363DD3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 13:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8Twqo/gWUqXfNbAE67EHmDQAczwGvUzdc+a0WQxpco=; b=lh9kQj+akyVqrXitGy8PTQqRDd
	eQkWzrqT/PRlvfC3yeUj3MBBHa+mmGvrmEKgD44M3l3wP2LFk0jqlL/R/ghto2mRNudg4oBl249go
	zZaOPROSBcXWtqOZCtZSdzSoUFO2c8xiHDlLrbbthcIJ8drdfRl/wsW5EEzMGFO9yIPhhkhsfid2r
	YyubLWYfd0uiaj2bZzT/pZts4UWaB1YJO6gvzmpcSZoVjvk/gvzTroYH6neWxlsRgHe/W2i6/pSZR
	xx+AEd7liwJxdCTLL7mW2WJrTvr3d8H5rQ7z15a63CBEkdBIFePhnInCduzZf0SEDaOfgIt49srWz
	AjvPpStg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaD7g-00000003jqr-43Kj;
	Mon, 29 Dec 2025 13:17:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaD7f-00000003jql-3Tug
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 13:17:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E248F60010;
	Mon, 29 Dec 2025 13:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA20EC116C6;
	Mon, 29 Dec 2025 13:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767014238;
	bh=ELRz3r/efm8jRls4UubxaTuJStZEM4hUic0vnRP2SLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aZfLe10dtjE3bAL+5UFV9QIdAPFxEPYcWsKPiZiosAHV3sV5LKnGv48DfZjpV3bmu
	 McBYdrnLGKBqqm9YtP496f/S7/BHFBjv+Z4wDFi6QL3Fwi2uJikV5/u/+rYnF98b3R
	 Ounvrvvu4fohz2IgQFm67nS5HVDRt2V83eMVDioAeOxiMc3YftkWH5mpHyUh9/f6I0
	 7PpVO/OubR+5ZBPsBdEH86XhcHbz4XdlIvw0R9AZwfmGE+s6jO775EwOFjM33s1IAz
	 yH6DSi+2qVjwxjMcMFqy7uUJVJwrKMkKmGyu1ZIrkNYiClYMsD+nGIOSFteCefIeuA
	 Z23fnNMiVumrg==
Date: Mon, 29 Dec 2025 21:17:13 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: imx93-14x14-evk: Add bt-sco and audio
 XCVR sound cards
Message-ID: <aVJ_WYf23l93i65y@dragon>
References: <20251201065844.3823323-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201065844.3823323-1-chancel.liu@nxp.com>
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

On Mon, Dec 01, 2025 at 03:58:42PM +0900, Chancel Liu wrote:
> Add bt-sco and audio XCVR sound cards
> 
> Chancel Liu (2):
>   arm64: dts: imx93-14x14-evk: Add bt-sco sound card support
>   arm64: dts: imx93-14x14-evk: Add audio XCVR sound card

Applied both, thanks!

