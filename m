Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E90CA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 03:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjT4eIz3gx9cpb3bB/A7BLnqv/sJrakTzUqKFsTtq7g=; b=w2aTEsKOEq4S+sdhBMm5R4xqp8
	sezliq2OYCbcCRJLzMMGmZgtqhn9t/uL7b12p8zKQ+19d5DU0nsk96FotGpybQRalZyUbIcoqrV0r
	qHraSG858rJZQZaZMdOxFIJ0rizGADrBCC9P8OGh5sTWSycOH9n8wLuRsGBrN4LCasQAlB/uBIjs+
	uvTYU5mJjrxoJCysFHubC678jqH+6azJV2/EBHAtXnw5DepsXUKZNEa3uMbcEA6CLz29sduXsRJJl
	mxnBlP1HvEbmbr1zB+inrjylPaBhOKPiRJ9raw5XAJ9OgiryjFZ+pAi2LevGhGVz6SLHbF89TPNgX
	4rChZbqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvpi-0000000HYqP-3L2U;
	Tue, 06 Oct 2026 03:27:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvph-0000000HYq8-16M3;
	Tue, 06 Oct 2026 03:27:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AC04601F1;
	Tue,  6 Oct 2026 03:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12061F000FF;
	Tue,  6 Oct 2026 03:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791257231;
	bh=BjT4eIz3gx9cpb3bB/A7BLnqv/sJrakTzUqKFsTtq7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=agzj5webOc/vjusOJXsIWgm1dpyC1w68XusjyTZ22WS+ZxS35CYb6KU++CaagoguV
	 6bEtjDOplbw0XofFS/QqmaVzjlTqrv4MqAceJZAmiXbw18hwuPli07voe6E+eiwDMC
	 2yr0OC6rbEMR9FAiQEqX5Azp6Y3FvSMkIpAuVcxfPHs+wFYui5WfTyuynN6oP6wFyw
	 sgChu/npvlZDM1olQrNozKtIthl0xYUv+IgSG+GkCEHABK5sAOXojyI+Mans1aV+wh
	 pZ3txDOEAyFQK4iue2cbvg4Yl8oLPlSGTigoek9n3TtDYcd5KKqDaYjpykneD9dZ55
	 ytnPfxGF1seHQ==
Date: Mon, 5 Oct 2026 22:27:10 -0500
From: Rob Herring <robh@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
Message-ID: <20261006032710.GA3539706-robh@kernel.org>
References: <20261005225944.1171574-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005225944.1171574-1-coiaprant@gmail.com>
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

On Tue, Oct 06, 2026 at 06:59:42AM +0800, Coia Prant wrote:
> Changes since v10:
> 
> - Drop the top-level "default: 1" for "rockchip,sgmii-mac-sel".
>   dtschema injects top-level defaults into every matching node, and the
>   injected value conflicts with the "else" branch that forbids the
>   property on non-RK3568 variants, breaking dtbs_check on those
>   platforms. The driver already treats an absent property as 1 (GMAC1),
>   so behavior is unchanged.

What? That's not right. 'default' has no effect on the validation. 
Please add it back. If the property doesn't apply to some variant, then 
default doesn't matter.

Rob

