Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2AAE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 12:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHPKCoOPHRsA6ZQ7YM8GXKSTQ1YP29MzcAkMMGtupDc=; b=tTbgVqIJ0qBirCFDKDAKNyJXVZ
	VRlJajDWzPp9OSYIBAhnuU3URK1dWP8qtnV1mi9sUZCgVOyP+UiBHnnN6Q+v9ZL4nG/q2JFfnakQM
	uWtel2rAF+hkJbaKcZIJU9bjn+38Um+jb6RspARG4TDOoCbAXvXHf7UiTMcfLAUTj3QwhmUmk1nI5
	Aoo3HnOa1DfjQjkRwgxHOnRRSVXKSg6WA1tA1ixVcTZwZj8ot5jpajEld54VDwzmTHN31CfcxDRnA
	v4HOxaahW+2/szgT3WhzcPOJcYFl223p3ZFFOPEAuJIgdTEP+Y09tY9db2oJ348YamEZWNplIPptY
	Q24MBZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUPNg-0000000GmdO-3YTn;
	Sun, 05 Jan 2025 12:05:20 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUPMU-0000000GmY1-3wMb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 12:04:08 +0000
DKIM-Signature: a=rsa-sha256; b=1h2crP9ZlNVaLJDOO+5Ofz/5fzVC4WaV/eoWtMkCMt2vz9uCYR2IBatU6ny4wozW8r+XHcza7bE7WXWkQWZs7IXLWia2puqYZoS5M6dxih15xpyRP2M3NUFn2myXICesdlVePRNN5tzjBAuXifx+YE6ayD1muio9q/aLTEe5aND8odSxlgJigxlj1kEPkZpPTZi5LXdeaPg+kSE0/b/jJWdRG792haugntrp93CrlyQuraBQOk1GHUSilys0Aeay5XQ0ENe2gYFWkI43ml3k6y7e9A7QLkTADLNQ7oN/2CPIVBM56TJmvC0vTbThn3kgekSTfn6YEswy9H+z+MOYYg==; s=purelymail3; d=purelymail.com; v=1; bh=BHPKCoOPHRsA6ZQ7YM8GXKSTQ1YP29MzcAkMMGtupDc=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1894976164;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 05 Jan 2025 12:03:48 +0000 (UTC)
Date: Sun, 5 Jan 2025 13:03:45 +0100
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: exynos990: Rename and sort PMU nodes
Message-ID: <Z3p1IV0rVH9dPQ_C@debian>
References: <20250105-pmu-sorting-v1-1-b55519eaff2e@mentallysanemainliners.org>
 <bb1e89a5-a83e-4e68-9568-073f9c4a8af9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb1e89a5-a83e-4e68-9568-073f9c4a8af9@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_040407_051411_D61BADF5 
X-CRM114-Status: GOOD (  14.68  )
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

On Sun, Jan 05, 2025 at 01:39:04PM +0200, Ivaylo Ivanov wrote:
> On 1/5/25 13:16, Igor Belwon wrote:
> > These nodes were sorted by name, but it's nice to have the same class of
> > devices together. As such, drop the pmu suffix and add "pmu" as a prefix.
> > This keeps consistency between other Exynos SoCs too.
>
> Well, most SoC device trees still have it as a suffix. Perhaps it'd be better to
> apply this change for all exynos device trees instead of waiting for other
> people to apply it separately?
>
> Best regards,
> Ivaylo

Hi Ivaylo,

The newly-merged 9810 SoC had it hand-fixed by Krzysztof while being
merged [1], and there is a current patch to fix it on 8895 [2].
That's all the SoCs with Mongoose cores (and the Mongoose PMU breaks
sorting). Only 990 is missing this change.

[1] https://lore.kernel.org/linux-samsung-soc/d1c6d2f2-f733-4cbe-8108-c9c9aaa417cc@kernel.org/
[2] https://lore.kernel.org/linux-samsung-soc/20241222145257.31451-1-krzysztof.kozlowski@linaro.org/

Thanks and best regards,
Igor

