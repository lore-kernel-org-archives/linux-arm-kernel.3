Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE20CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 10:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvUzKHDCnSmxQgnC6Ad75ATk8j7aHV43jdVvweIXZIQ=; b=pytpmzj1RlDN7GzScQrwJtSZGT
	08wV76VpaEcp/OlGh40lQRp7X+BYOo0EE9p2H1RKJx3090hS3+yJ3/pb7RKkBXejUBhRIfSUWSiaG
	k232Y/xC4M/KZFp2JmVHWu5wdSpDXYT8tcu0yIRBwffH/UE/qKNW14tSv75zLQW4afZwxphnqx/9n
	/sy6dyVg+gURMZ0PlXTC8IKWyYdCVR3vxhPGXVB36HV1ptlmu4Gab11a6gw/OAjhiTOp4fkL4eLIZ
	lPiu/DkSkSRS7dMFoiMtaguCu7FQq3hN5pM4G/g8+7DN8jGMjcr6uwQ32zRkVS6FFQgPk40rpUrHg
	ywZjGUSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJKB-0000000A5eJ-1qu4;
	Tue, 19 Aug 2025 10:12:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHsW-00000009pab-1dza
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 08:39:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88E75601E2;
	Tue, 19 Aug 2025 08:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B700C4CEF1;
	Tue, 19 Aug 2025 08:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755592774;
	bh=S/iXwuz8N0uwMCfHp+T12qa3ce4k79eljimBk6WuzjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNt8FFRJnA96OKeSLKP2MFsA3PbVp2Pbq7DnODQ3ldCYJEyR8gQ1JkdMYSdH0nBUi
	 J0fqhfqnq39Ral5NVj8NMSMgsjx/6hftzdv5/wWbB316pzpyYMFhajiZ2mivEFdWVv
	 dWYiG2y0HmO77VM+RsG8rVciewaTX+HtnW67wEdX0i5yjvcxfcJISp9q8fTcKEH85M
	 1ZI6iMsEo31AWAqzvfFG8ba95as+0t+Eelh8ETSCvTQNIuVK52lZjmwD+wbBbPx7Q7
	 QfAVBlchlqBNcI81b9sgaFZnl4LRWsgHO5oYvvlZOOziCcZZ8q7Mk2aRbmKyFcbRT4
	 rb2XVczqFiKhg==
Date: Tue, 19 Aug 2025 09:39:29 +0100
From: Will Deacon <will@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH] MAINTAINERS: exclude defconfig from ARM64 PORT
Message-ID: <aKQ4QSAqT7OLIBf1@willie-the-truck>
References: <20250818-arm64-defconfig-v1-1-f589553c3d72@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250818-arm64-defconfig-v1-1-f589553c3d72@collabora.com>
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

On Mon, Aug 18, 2025 at 11:08:04PM +0200, Sebastian Reichel wrote:
> Patches for the arm64 defconfig are supposed to be sent to the
> SoC maintainers (e.g. a change in the generic arm64 defconfig
> required for Rockchip devices should be send to Heiko Stübner
> as he is listed as maintainer for "ARM/Rockchip SoC support")
> and not the ARM64 PORT maintainers.
> 
> While we cannot easily describe this in MAINTAINERS, we can at
> least stop it from giving false information and make it behave
> the same way as for the MAINTAINERS file itself (which basically
> has the same rules), so that it just outputs the LKML for the
> ARM64 defconfig.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index daf520a13bdf6a991c0160a96620f40308c29ee0..b6466a628381bf40ebcf7e3638ec65fabf6ad357 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3667,6 +3667,7 @@ F:	drivers/virt/coco/arm-cca-guest/
>  F:	drivers/virt/coco/pkvm-guest/
>  F:	tools/testing/selftests/arm64/
>  X:	arch/arm64/boot/dts/
> +X:	arch/arm64/configs/defconfig

Acked-by: Will Deacon <will@kernel.org>

Will

