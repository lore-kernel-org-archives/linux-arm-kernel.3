Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E50CCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 16:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJe+n1FEYiHGIKYKtgQ9xuvzcbmY3aEwUNiPZ+AEOkg=; b=wobeBpk8aFsLtSfSoL3py1vrG0
	GRTdeMCTmHotj4QPi7Kh5KUn7qmJKaIQrISYht8U6IQ9645Tom1oubFvzKi8PJGhlsAv9gIAQed8B
	O6yE40MulkuZWbBWZ5Wx1faw+1E9C+202Cytq8fHOGl5AFiNHGvqKy+T+HSeo33ROmZgew4Oo27qJ
	t2BsCzwKVDl/7+T683u4bKjy3/goyVsXSxgk8SXJ45tJ0J2jA2bUQW2R5qjulO4kSOgT5gR5QVzve
	lFsOOzhlLxe+K7QYllDOLY80K6CVRUkKwZjIz7VZMMqSBRICw6N5ou7e2oWym84XkvTt6Fl45vdXc
	2hYpspPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjjg-00000005AJ6-2Jw7;
	Wed, 20 May 2026 16:25:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjje-00000005AIR-2Nhb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 16:25:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A41C409C2;
	Wed, 20 May 2026 16:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6F01F00897;
	Wed, 20 May 2026 16:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779294330;
	bh=dJe+n1FEYiHGIKYKtgQ9xuvzcbmY3aEwUNiPZ+AEOkg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aanMXZa4UfmwVMlkgxnCkJS1MXRvSj13HrBieCfkEdl+p3nM+arGb+6qJt4Nze0fC
	 f3SlGG76p/FQ1SmAMn4QRmR3ogx5G+fpTWaw4rsvzU5ct7E3d/rtsJ0NdYcXVVVzNP
	 OKDU/9axV5prL06AFOEiRa+rSdkrbrmHC6NVXHHyITa1Xuo9UlrE/k0FimrFRsF71A
	 ZNxrejQ7WFMES/SfFQPBzfCMHNc06KReILVrYjeYD9zoBXJk9Hfw3fkk09BoqkyYW0
	 RhFD+m4Z2gnYjDNTPxj+ZJyQ8p2l/Dz2A2HYBCxskUpCxgqX/8RZu5atJQ4zsazai7
	 S1xWRUVcxZJoQ==
From: Lee Jones <lee@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
Subject: Re: (subset) [PATCH 0/4] power: sys-off: fix Pixel C shutdown via
 MAX77620
Message-Id: <177929432727.2891971.15568098895295536822.b4-ty@b4>
Date: Wed, 20 May 2026 17:25:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_092530_626417_E07891EF 
X-CRM114-Status: UNSURE (   9.40  )
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

On Thu, 14 May 2026 16:47:18 +0200, Diogo Ivo wrote:
> This series migrates PSCI and MAX77620 poweroff handling to the
> sys-off framework and fixes shutdown on the Pixel C (Smaug).
> 
> The first two patches replace legacy pm_power_off usage in the PSCI
> and MAX77620 drivers with sys-off handlers. Besides aligning both
> drivers with the modern poweroff infrastructure, this removes the
> global callback dependency and allows multiple handlers to coexist
> with explicit priorities.
> 
> [...]

Applied, thanks!

[2/4] mfd: max77620: convert poweroff support to sys-off API
      commit: 1ada6d7f88063dd6fd92d74d0b803875b695fe01
[3/4] mfd: max77620: override PSCI poweroff handler on Pixel C
      commit: ea3f90bcc8524c6d514f6b8183cc202b79b082be

--
Lee Jones [李琼斯]


