Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB33FC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 13:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KY+2MWjuH2v4j9LnacdOFMSvtYVkE7RsvZRwGr/i98g=; b=v/dmY/TSqlSrojsVbSjoNC9l3/
	w3xYvcxbFQDaA6NhUuqpz4CmiPC6zY/AV9Lpqe7yw79U4OdXhpmsRjlURpwFFHxAfHkktJhqMnXsc
	L0j49cpQJ4B9GuFKC55rKEtOSmhMlX6Bym48KVQSy7PkhsLRhxCy4fyGoPSmh1wNkinNRRvfLpHyP
	4KK7u6jpQLzuiwL/7Rq5X6Fjg5sirouUtaslFKx7Nwm10m9kIcGSqxb5meAjkbAaouRUm+J0CGGQp
	YWH3w+8itrYW7A8UGefaIv33vuco572qiql3MOFonlkMp5MDJtDdcApgTbFierYtAh01zRoRF8aVf
	/SF+OtJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th799-0000000EvPJ-0xl2;
	Sun, 09 Feb 2025 13:14:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th77k-0000000EvIM-2FrC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 13:13:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D6E47A40336;
	Sun,  9 Feb 2025 13:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 494DFC4CEDD;
	Sun,  9 Feb 2025 13:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739106803;
	bh=KY+2MWjuH2v4j9LnacdOFMSvtYVkE7RsvZRwGr/i98g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOlLo7jXi17egTi/YFh3PzU/Y0IT7NuVIK46wyh5TtJcTaAdJt++PENlhszLbFWqA
	 5+muXfxpjfoZ1vrxH3al/9MMzmR65pGefhWVLYSpuGqEqG24g9aH8kVy9XqabJkmmo
	 ik0oj+RDrYCGqc4DxBT/lHG9PwlcIVOrlbFnw/m2dPwpMBav6YGzjHGgN34idR3k6d
	 0j2Vrw9DiPzI/AHrH1KSyuAwzXKgKiYC0/eNp33R2imoMHJx3wXKG+Pwe2XhrqAwq6
	 R8cNBcqnnMZ0oByklOFdNN/dkgPOmJ/i9hv6VGDxqarQuEaeGalDh4+DtFztYra/Te
	 IqKBvQxSdnyug==
Date: Sun, 9 Feb 2025 14:13:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sergey Lisov <sleirsgoevy@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: serial: samsung: add exynos7870-uart
 compatible
Message-ID: <20250209-roaring-wasp-of-variation-58dc8e@krzk-bin>
References: <20250204-exynos7870-uart-v1-0-06be6aa96284@disroot.org>
 <20250204-exynos7870-uart-v1-1-06be6aa96284@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-uart-v1-1-06be6aa96284@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_051324_643320_AABA632C 
X-CRM114-Status: UNSURE (   9.55  )
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

On Tue, Feb 04, 2025 at 02:08:45AM +0530, Kaustabh Chakraborty wrote:
> Document the compatible string for Exynos7870's UART driver. The devicetree
> property samsung,uart-fifosize must be mandatory, as the driver enquires about
> the FIFO sizes.

Please run scripts/checkpatch.pl and fix reported warnings. After that,
run also 'scripts/checkpatch.pl --strict' and (probably) fix more
warnings. Some warnings can be ignored, especially from --strict run,
but the code here looks like it needs a fix. Feel free to get in touch
if the warning is not clear.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Best regards,
Krzysztof


