Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8BBE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 22:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PNDbc7G8jzn3foVKj5RIrzXm3mfQTgjskEhNJ1rJRDg=; b=fmKe+hwNNJgV57TEoQ2q2vUEfN
	7bzumAH2xkQBu8wi9V1nuhHN9gZBgy7hvOgSrbPsbChVoN0bpdgkA2hfU9dLCX20sdQGEvHEha5Eg
	9Zd4MC+iD1IMJfZmKNEuvfuinuwLGi3A5ZuauetUx+de1iDyuOGSL3lG9Ex/qaffGG87ZfJwNTIMG
	t3NmoXBvUeMDlDG6sEsMz8oSZpMuZbfHec7ejuyG9izIvXX9AmEZhEmGUgur+gSHNVjoJ54o6Mxpi
	2BzwMKKJ5b0A2ziKz9WVTX20dkeLZBV2WCgv9by7nxxtTsEwwpFbea0dxi2AnpUIKQomeDMWRCEnk
	dbGeqsLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMasX-000000074GI-1ZLR;
	Sat, 14 Dec 2024 22:44:53 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMarS-0000000749t-2zGf;
	Sat, 14 Dec 2024 22:43:47 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4678f681608so33699821cf.1;
        Sat, 14 Dec 2024 14:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734216223; x=1734821023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PNDbc7G8jzn3foVKj5RIrzXm3mfQTgjskEhNJ1rJRDg=;
        b=hn3fWTZ7ubJ2V61ibJdfutL2tXZDjHg/ZhpCRWTwZYf4hzOCRUl/+MveUniRNgV1ZK
         Rlc8KwMB2GkphanVBHNOaybGPRqH68fCP0nVCZfEYbLei0W7PnHEuUeh5CzbtSqe+Qso
         v4/U4Y1UkMTGaB340+F4SdUVu7gDaw9PLf7G754bjVVeOkk7rkLOrfDZ7kP1GldjIzmH
         GWvHGyuV44TKFsAwlFHVC9wKF++U7CZuxqeX5yYltN7F25BiezZIrhxOk60lgCc/0kTb
         iUbsGcpyLKv17rh62CxaIy/mg9iX4xal+lCRi6ZzNXnCcmFipp8/RhuA83FfP8Ptefo3
         3K4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734216223; x=1734821023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNDbc7G8jzn3foVKj5RIrzXm3mfQTgjskEhNJ1rJRDg=;
        b=eynfOirI8z73WNfrscH5win2g5vIvQ+yz4XDnHXec5A3LxeRyQbqgTF00Sgq3oi1IM
         9K8yqx2ycVDgNpfnIqj0uc08Ojyn6s5Ca0cnEpltxWr5PY5r1Qa9ZEftu4rqCV3Ois7n
         vsLxt1pU/HZspm9c4xQ8fR5vZsCBTYynaaueZGtK0RtpbdGoxOF7sdzDK4Ba+GBTjeKT
         A6GtJwaa6urRuP50h4J1iKZfVBGOhgBKPfS9mLbARU6T4OSvSzQ8foO8oTWJ9QrtjSFM
         hmBMjrkMvO8VSMf8lBkOWWnYImWKCC27PKb17byEXyVxE5PSqTDaG+9OXpeMm+zGav+k
         WsrA==
X-Forwarded-Encrypted: i=1; AJvYcCUxPkHpT7Jc4Js0m9bn++mIzmzl7ltG67T6wuOPLKh6KrXLZ3JBLWo96N4kiVUTfAvPbHPomxHUP7dFtrM4hrcS@lists.infradead.org, AJvYcCW2eaZa7G+LVcBbCpHhWWq7NaWNghOTgWGCokRobniZBMhdl/B65GrcQkW/cp22/knghHwxstjRtfkPI/3vB/I=@lists.infradead.org
X-Gm-Message-State: AOJu0YwN7plEQjLbf0tL4qDMZmlkkrIVvLzDlVr+gHJW6hFHrZ2Vor09
	IO+j/ss9tlWQQt3bctlDfeRW43jHH2VXBGAJV/+PRN19tHdBPeoI
X-Gm-Gg: ASbGncuVW7Z7wwCG1400byJrqYchpuFzNBAOCWlQjoFn2G15oPTQXabGGqwnBSdtIFb
	d85bv8rsPijz46UnJB0ka9LnLg82L0lra0I1eDz+JW35sKNglg/IPDNRXbNZCl+yB8XfGLP3dCV
	SaQZa9G+7vU13JvhhDUHQo3Tx1KDI2r3OesCZjSV9K5r4C5y+xXOIB8pLOP2POfYVOJpQLH4u0R
	jyLDfRafhLyBhOrIC6+mRi5MKfZ28Wl8zZwLbBxNrb6lyTL0zbu9a0DpCuDLwYamEta
X-Google-Smtp-Source: AGHT+IG7IXU/c0iNtY9MhcZRQQ569PFHhr3zCgYEkNpnGAd30NXOtGTn5aSphWyBODh5sqgfqfsOvg==
X-Received: by 2002:a05:622a:144e:b0:467:51d7:e15 with SMTP id d75a77b69052e-467a5718d1fmr139468471cf.7.1734216223365;
        Sat, 14 Dec 2024 14:43:43 -0800 (PST)
Received: from master-x64.sparksnet ([204.111.53.241])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2e8097asm11434201cf.63.2024.12.14.14.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 14:43:42 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Peter Geis <pgwipeout@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Alex Bee <knaerzche@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liang Chen <cl@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] arm64: dts: rockchip: add hevc power domain clock to rk3328
Date: Sat, 14 Dec 2024 22:43:39 +0000
Message-Id: <20241214224339.24674-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_144346_750227_568137D8 
X-CRM114-Status: GOOD (  13.03  )
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

There is a race condition at startup between disabling power domains not
used and disabling clocks not used on the rk3328. When the clocks are
disabled first, the hevc power domain fails to shut off leading to a
splat of failures. Add the hevc core clock to the rk3328 power domain
node to prevent this condition.

rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 3-.... }
1087 jiffies s: 89 root: 0x8/.
rcu: blocking rcu_node structures (internal RCU debug):
Sending NMI from CPU 0 to CPUs 3:
NMI backtrace for cpu 3
CPU: 3 UID: 0 PID: 86 Comm: kworker/3:3 Not tainted 6.12.0-rc5+ #53
Hardware name: Firefly ROC-RK3328-CC (DT)
Workqueue: pm genpd_power_off_work_fn
pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : regmap_unlock_spinlock+0x18/0x30
lr : regmap_read+0x60/0x88
sp : ffff800081123c00
x29: ffff800081123c00 x28: ffff2fa4c62cad80 x27: 0000000000000000
x26: ffffd74e6e660eb8 x25: ffff2fa4c62cae00 x24: 0000000000000040
x23: ffffd74e6d2f3ab8 x22: 0000000000000001 x21: ffff800081123c74
x20: 0000000000000000 x19: ffff2fa4c0412000 x18: 0000000000000000
x17: 77202c31203d2065 x16: 6c6469203a72656c x15: 6c6f72746e6f632d
x14: 7265776f703a6e6f x13: 2063766568206e69 x12: 616d6f64202c3431
x11: 347830206f742030 x10: 3430303034783020 x9 : ffffd74e6c7369e0
x8 : 3030316666206e69 x7 : 205d383738353733 x6 : 332e31202020205b
x5 : ffffd74e6c73fc88 x4 : ffffd74e6c73fcd4 x3 : ffffd74e6c740b40
x2 : ffff800080015484 x1 : 0000000000000000 x0 : ffff2fa4c0412000
Call trace:
regmap_unlock_spinlock+0x18/0x30
rockchip_pmu_set_idle_request+0xac/0x2c0
rockchip_pd_power+0x144/0x5f8
rockchip_pd_power_off+0x1c/0x30
_genpd_power_off+0x9c/0x180
genpd_power_off.part.0.isra.0+0x130/0x2a8
genpd_power_off_work_fn+0x6c/0x98
process_one_work+0x170/0x3f0
worker_thread+0x290/0x4a8
kthread+0xec/0xf8
ret_from_fork+0x10/0x20
rockchip-pm-domain ff100000.syscon:power-controller: failed to get ack on domain 'hevc', val=0x88220

Fixes: 52e02d377a72 ("arm64: dts: rockchip: add core dtsi file for RK3328 SoCs")
Signed-off-by: Peter Geis <pgwipeout@gmail.com>
Reviewed-by: Dragan Simic <dsimic@manjaro.org>

---
I am pulling this patch out and submitting it standalone. Otherwise
there are no changes from the first submission.

This was found via educated guessing and extensive testing. This clock
is sufficient to permit the power domain to function, but additional
clock work will be needed if the hevc block is ever enabled on rk3328.

For anyone wishing to attempt enabling the hevc or h265 blocks:
Currently the assigned clocks in downstream are not sufficent and the
board hard locks if accessed unless clk_ignore_unused is applied.
Notes from the rk3328 and rk3228h TRMs show the HEVC and H265 blocks
share common clocks and domains, along with a shared sram block that
also needs to be enabled.

 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 0597de415fe0..7d992c3c01ce 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -333,6 +333,7 @@ power: power-controller {
 
 			power-domain@RK3328_PD_HEVC {
 				reg = <RK3328_PD_HEVC>;
+				clocks = <&cru SCLK_VENC_CORE>;
 				#power-domain-cells = <0>;
 			};
 			power-domain@RK3328_PD_VIDEO {
-- 
2.39.5


