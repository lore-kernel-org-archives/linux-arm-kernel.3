Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18929C2A072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 07:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iKPvLbeIhMb8/OpxJH+S6Wjo+A1NnxcK8qrv3fzzsc=; b=Qf5D8pD89YM4HJzPBRparxKHPc
	MEMvji/opw9vgIg3mXftLlQ/t/3EGSgBR85yaLy0WtoMVqrGuWBjZacP68TpIhu1eT/TBlWgktF99
	fFemotBhGiMgLgR5ypsrFjUSswxgwjqlzvTLdm/1Y4Gd2FMcfPCAQrSlSj9TtzBF5aEdu1L3eXX1K
	VNB1RcYanq6KqWbVXom4+/3G9E/U3VsnTbO6EY6VXrpVwaHbeaHk18jJLPcTPDhBVQ+TWS2e14wWW
	5ugzHpWVXAiRXu3gfwhOVY+bepqXtcAfzGk7p6ePw07eEOpr6/wWKZg44HN9PSrJImQWxcl+yaZ9z
	tX9807Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfRM-0000000AwFS-0wEM;
	Mon, 05 Jan 2026 07:55:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfRK-0000000AwEt-1dY2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 07:55:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 848BF6001D;
	Mon,  5 Jan 2026 07:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4CDC116D0;
	Mon,  5 Jan 2026 07:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767599745;
	bh=egTyVvYfwf14ijcZfGgVQuVyGcHIfmNUWLP9o5rocq0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bOAyElvod6hsBagCdn70ZeYXTyQOJvhfUlpF4n+WKmCulfFGSVj37ZGq4MDirooKx
	 Jw/YZJHI+KbMIngK0odEQ6pLi06BjHKP9hzAixZ4aZdjyMwaR2F+d45ArKQnm3LJCI
	 lVT69qHVaFIdP0VV+nVTAOikD0sUVFVnWrMI+A/qBmuB1nX2GjRv8/NzaknOQgjw3a
	 Cb9WIKQnkGr1X+KnjPvcb8ePBeyHBj9LksFSknVAePIUU2Y4rwKgpYK/qSn0w07HIK
	 yviX3KotkB10mB+YkTLZNsh8jMTXlqHPPu7ZFUHzZISW2yCJM9SpCHNafpBGTmAXSj
	 escS6wDYCMhEw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260102-exynos9610-pinctrl-v3-0-3f21f2cfb651@chimac.ro>
References: <20260102-exynos9610-pinctrl-v3-0-3f21f2cfb651@chimac.ro>
Subject: Re: [PATCH v3 0/3] pinctrl: samsung: add Exynos9610 pinctrl
 support
Message-Id: <176759974254.17011.15262742954028365380.b4-ty@kernel.org>
Date: Mon, 05 Jan 2026 08:55:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Fri, 02 Jan 2026 11:29:30 +0000, Alexandru Chimac wrote:
> This patchset adds support for the pin controller found on Exynos9610.
> 
> 

Applied, thanks!

[1/3] dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
      https://git.kernel.org/pinctrl/samsung/c/2432700e9c927d3c4ba1219db24fb2634282f45d
[2/3] dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
      https://git.kernel.org/pinctrl/samsung/c/891eb0543f203cea0a85a4878258eefa9d3f84b0
[3/3] pinctrl: samsung: Add Exynos9610 pinctrl configuration
      https://git.kernel.org/pinctrl/samsung/c/9ce17ff1881f5be272ec016e108ae68be4b73646

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


