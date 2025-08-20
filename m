Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278FCCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 08:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cb4CTa4khRkhXoHP9hGMAI4OWMfdIrzKxXnUyCaI3OA=; b=c30twmhANI4CwiJUtffuL+loC2
	dUQYShgnZxaJYbdZEiwRESpUFtOep8VWpN88q3rfT1SgR1kgnOXgGpdP7Nfy8+FPji7fSAEwkyJ9j
	26py9Mm9dhdRjz2tj5wkDQhvcVTMjxD+563rdISQhgrtzM3A8Q4zwQ0girq4/5EKhhEEWc3LmHjtb
	KZfnt4D6eWbfCNge0Nq2kJxD37lZ2DTlxhvaInfsDJFeUsiDO8luuCeS5x6FPJbhDa5+SRg/HIa+g
	eM9HgafdWmhR8aNpXuysouW47P5mdVDKwaJ5V44C2MHoW2YpAOw/pK+YuVasAwHQRPmJoZx+aUkju
	uur60O+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoed4-0000000Col7-1WbQ;
	Wed, 20 Aug 2025 08:57:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodvD-0000000CgiV-0BEn;
	Wed, 20 Aug 2025 08:11:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 76C216113B;
	Wed, 20 Aug 2025 08:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AFF1C4CEEB;
	Wed, 20 Aug 2025 08:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755677510;
	bh=7I4mVhsZ4PWXlRPOcS5Vrjm3MfJ24J5kXv7MZGrueVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=irknLw6HuwAWuSpoOl4fh1JZJBvojr+SJx27gy2XXvH8vp2SQIp76Ei5+15Uy5T2D
	 KcPgbPBIE8FZUoO7HKg3AvRJ3cxZxkCOI613d9KsFLgVtFHDJQHuJI0Lfbaxzp4NMf
	 ZAi6JN0SXueuU1bc+rBwyxTCaA+n3OjaK4qYM8vh+7zUyX9CDxhd4FKa8d24rsZ9Rv
	 hzLmnsGPqVl+wbDH1wOunRjDUkKFMc4yzsOEsqsoXa5UG4SKyzBBXlbM7/oyp8C6Y2
	 56QCSbLzZWluN7V3mb0+MWTOC89SCsJkyR8JerWMjfkDJgeI62goisrSn6PNUbELzl
	 oD8hK5UNiamWw==
Date: Wed, 20 Aug 2025 10:11:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/13] arm64: dts: amlogic: Unify the compatible property
 for clk-measure
Message-ID: <20250820-sweet-herring-of-luck-9c3431@kuoka>
References: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
 <20250815-add-more-socs-to-support-clk_measure-v1-8-59f04ba67457@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250815-add-more-socs-to-support-clk_measure-v1-8-59f04ba67457@amlogic.com>
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

On Fri, Aug 15, 2025 at 04:37:34PM +0800, Chuan Liu wrote:
> The clk-measure IPs across Amlogic SoCs have minimal differences, so
> they can be managed with a unified compatible property.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi       | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi         | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi        | 1 -
>  6 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> index ab9ebabce171..570cac451d63 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -761,7 +761,7 @@ internal_ephy: ethernet_phy@8 {
>  			};
>  
>  			clk_msr: clock-measure@48000 {
> -				compatible = "amlogic,c3-clk-measure";
> +				compatible = "amlogic,clk-measure";

NAK

Don't ever send such broken code. You just affect all users without any
valid reason. This patchset is horrible.

Best regards,
Krzysztof


