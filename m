Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09C2E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 12:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcrRTNmHlUYLuRQNrQr9U4MVslePM57JS9RWCnZ1tYo=; b=mdKDsa4aK3pvp8SwJNxFWXhIxB
	i1+X90IVPcdGPIvSaP4evzChgY2PerI4IPpBOUo02Me91bTUjjhtFKkpLv/dRmn+wMor1dEuTPKEF
	j+NkykfJsFRH0fYhWwv72Al9mOZA6+ZadynHmZOKjDTLhMonTGsrAIhtmDV89sgojIvc8v/QzaJ02
	O4BWz3ccu39+tyn2GnfJ2W+UIwl/WVR1YG3IpU3meDdD7aES8fwa0qk4RKgJ5ACylp4zAFmt/r6YM
	Onm4hkzvQCifxBWHtkBDRyIYCGxpFQiwPgsbAidt40fRrbhe+YCnYVbgc0mfbNs2764AtPTqTDP0H
	kn4ncFOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUPbs-0000000Gna3-18Lp;
	Sun, 05 Jan 2025 12:20:00 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUPag-0000000GnOY-3Ipp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 12:18:48 +0000
DKIM-Signature: a=rsa-sha256; b=egP4n2ym2pyY0NZ6nIdTZabBoHDfJXlnIdxrsC6oxZAJpmWWgvDeHLaM+N3cBN1HAWWumtJ9yRYUCv4kr8EpYVXX/+wppYAbbPnPemDqBeHfqi0eYjETMd+dbRbCLg/TeloC7SJHQtYBSiJ1ddW35CxYjyKzHClO95nu7u5UXL6nXK9jyvYt2GNbKxTTmWQ7CrGlUx3zEY+tGp79N1K6fBq86K/6WyRpDRUmIHGOBwH2X7IKjrkbmibBO55d+1SOttauVHgHQ4VuGCYbAPKSBYFAd+kut4XB825rAaQjJh2F+jKYlIz1nUL9p8o0jy0/OsE5FK8SBo1br52xsjoGXA==; s=purelymail3; d=purelymail.com; v=1; bh=75ZZPQPJDwbcguFEzst3gHnA+GRgtEJMBotKkjqpuj4=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2020578906;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 05 Jan 2025 12:18:27 +0000 (UTC)
Date: Sun, 5 Jan 2025 13:18:24 +0100
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Markuss Broks <markuss.broks@gmail.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] arm64: dts: exynos990: Rename and sort PMU nodes
Message-ID: <Z3p4kPoya12wR5Wh@debian>
References: <20250105-pmu-sorting-v1-1-b55519eaff2e@mentallysanemainliners.org>
 <bb1e89a5-a83e-4e68-9568-073f9c4a8af9@gmail.com>
 <Z3p1IV0rVH9dPQ_C@debian>
 <6b66b484-badb-4a99-b19f-5cab019cc5ea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b66b484-badb-4a99-b19f-5cab019cc5ea@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_041846_920217_4F1ECC25 
X-CRM114-Status: GOOD (  24.36  )
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

On Sun, Jan 05, 2025 at 02:10:37PM +0200, Markuss Broks wrote:
Hi Markuss,
> Hi Igor,
> 
> On 1/5/25 2:03 PM, Igor Belwon wrote:
> > On Sun, Jan 05, 2025 at 01:39:04PM +0200, Ivaylo Ivanov wrote:
> > > On 1/5/25 13:16, Igor Belwon wrote:
> > > > These nodes were sorted by name, but it's nice to have the same class of
> > > > devices together. As such, drop the pmu suffix and add "pmu" as a prefix.
> > > > This keeps consistency between other Exynos SoCs too.
> > > Well, most SoC device trees still have it as a suffix. Perhaps it'd be better to
> > > apply this change for all exynos device trees instead of waiting for other
> > > people to apply it separately?
> > > 
> > > Best regards,
> > > Ivaylo
> > Hi Ivaylo,
> > 
> > The newly-merged 9810 SoC had it hand-fixed by Krzysztof while being
> > merged [1], and there is a current patch to fix it on 8895 [2].
> > That's all the SoCs with Mongoose cores (and the Mongoose PMU breaks
> > sorting). Only 990 is missing this change.
> I believe for Cortex PMUs it's also preferred to use the e.g. pmu-a53 name
> instead of arm-a53-pmu. This name is at least also used on exynosautov9,
> exynosautov920, exynos7885, exynos5433 and exynos7 (list not conclusive). So
> maybe could fix it on all SoCs at once, instead of making individual patches
> for every one. This is just a suggestion though, your patch seems ok.
Thank you for the suggestion! I held off on doing this because in the
8895 patch, Krzysztof said that the pure-ARM design PMU naming was too
trivial and unimportant to change. Mongoose PMU however breaks sorting
in the tree, so unlike the arm-pmus, it's more important.

It's up to Krzysztof if he wishes a global change for all affected
Exynos trees.

> > 
> > [1] https://lore.kernel.org/linux-samsung-soc/d1c6d2f2-f733-4cbe-8108-c9c9aaa417cc@kernel.org/
> > [2] https://lore.kernel.org/linux-samsung-soc/20241222145257.31451-1-krzysztof.kozlowski@linaro.org/
> > 
> > Thanks and best regards,
> > Igor
> > 
> 
> - Markuss
> 
Best regards,
Igor

