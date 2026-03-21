Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047AC109446E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 11:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXsAympkrLh/Y6UG6lKSkBRWX4lQc8KJDnqB0wQH9Js=; b=dRgwJR/YVC/FGoIaNiO70k1ssU
	DiRY5ody7OCJxqvajnAU2G6jzYbvv1aqpirhg3NtYtgIgFACs54Jju1xhoID6wZ7ToeCRZ1i8B6RM
	k3pWyueg1Q1rI7FC4huYNQVWcoLmmt2caPLWeVDghPWS56q6UhJDReKNNgyRVUyy2ul0KgXZkVrhW
	bofyJXhFfRPUUJY+UHefT/qNqJbuzyTAyMu5F/nHCv/CxPYt4FktfGqiFRjjs3vUrP+w+i33v8j45
	Sy8+xVT1ez9IfXEJsezHhwvkALGPMn50ThVfIZ9mW6VBcEndQIMUV0+A51djb/omK0vuZE2lVSLHZ
	seOiDgBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3uC2-0000000EONW-3mOR;
	Sat, 21 Mar 2026 11:08:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3uBU-0000000EOM5-1p8a;
	Sat, 21 Mar 2026 11:08:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A33E843F23;
	Sat, 21 Mar 2026 11:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE45CC2BC87;
	Sat, 21 Mar 2026 11:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774091279;
	bh=XFKXQYD2kqtkA+jmGE+zutnLx77qCWoy1ZMLmExRUQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oDtl0JbhwyGaTS3tJOgb0IKjl9F5z6iruceht5j7MrEqf/WDtASl5vIFDFdhhi6wy
	 mx6FlXOv6WoUNY00PAN0egRVBn6DTS4beAbAzrUj9S+HDrXsc/52+Zl4/Nv26Dx5Sk
	 Ati9hJBG/oYm1bF2Wd5oy70ILDx3jGEp3LS9ozEykAmudpNfHYhPvoSBbW96cfVulM
	 OpZNP+u7zcx1cgecAXRkHgxuzQ017T02RE3lmBQY3ixVoqt9GGgscR3bwdaYz2QztQ
	 OCVRbLj59KRKIjBe3s/MUeaR6JU9Cb755/WSzVuYDJcr1mjXVWwlKo+ToVhLlEyk8b
	 d1FeKlu7wEuPA==
Date: Sat, 21 Mar 2026 12:07:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 Device Tree updates for v7.1
Message-ID: <20260321-aspiring-real-foxhound-4a18e7@quoll>
References: <20260320085641.15843-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320085641.15843-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_040801_501745_0B63B6A9 
X-CRM114-Status: UNSURE (   8.36  )
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

On Fri, Mar 20, 2026 at 09:56:38AM +0100, AngeloGioacchino Del Regno wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v7.1
> 
> for you to fetch changes up to 820ed0c1a13c5fafb36232538d793f99a0986ef3:
> 
>   arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count (2026-03-12 13:32:17 +0100)

Days in linux-next:
----------------------------------------
 0 | +++ (3)

With 0 days in next, you cannot really react on any bug reports.

Please send pull requests for next releast with code being in the next
for at least few next releases.

Best regards,
Krzysztof


