Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5ABC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OLvPkZKAPsSMnxafsZaEnvYemBph/BJy+bYFdl2FKPc=; b=b93AEIuhPPz1fKjhkPgzwsNhtO
	hTZEDKxZQ6VUzribCTsynT8UJtgIL7p4Fx6INitmTjXHrQcKs1ZDSjOzdtEl4q9MPDeth+TBVR1c2
	VAxLpdCvpU+i32SPck1ndQ1k78FdQpD5TYQBP73ShIbGrdd3bhyLJ2Bnzd4w92KJbTAgcUZLd0Tqu
	ZNNLtFUmX1CYV3nvEHbJWBsjUdBPLvArneWFaAy1VOtlA2+CY2Xoe2i12F1S2SkoYo2OwF12Rh9kz
	E8A4JxroTVdREOqWeQbofeoCkOdNMhWmwfW7N5OKp38tX/HAUOa3qn816QzieivxQh8MHur7wxryr
	X/B2uYQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRsO-0000000ARHL-1RFZ;
	Fri, 07 Feb 2025 17:10:48 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRWM-0000000ALrA-2pNI;
	Fri, 07 Feb 2025 16:48:04 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7b6e5ee6ac7so171396385a.0;
        Fri, 07 Feb 2025 08:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738946881; x=1739551681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OLvPkZKAPsSMnxafsZaEnvYemBph/BJy+bYFdl2FKPc=;
        b=fJrbPES5yu3HMwHiTOguPSPHj01RNJFYaZVYurRj2CixjbGQGI09HzrQbgLfi9opn3
         vK0GJIV3ag6nEd6PcmFRUfCN85NswLaeZjiltyUptPokv+A8nCUvOjNh4JRFhWxx1Iaw
         +omNWcekk1PU1/ciTH92+1EyjKwUEzTYTU1ku7a8jkpLlgQIL4dkVdcmAme8LuTLcqfz
         /NEFe6vQ1KWhnA8VoHYcKcmWEZApv5Fk0EhCO3zK/efMosExprueK+r2HGdD3B41cAjw
         iZJ6y7t+VBNxFR6TG3AVuhdtLOGM46vmvZuH8WK150Avduh/r/ewyKZuYDHx0NfEbStm
         702Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738946881; x=1739551681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLvPkZKAPsSMnxafsZaEnvYemBph/BJy+bYFdl2FKPc=;
        b=HK+uIzkv12/fABnFeWkm81ejvVi/OwL+FFs9bHxE5OStE2An5Upb3gqSmTQcZwO+d+
         A2hVnBEz15Y3afmF41TDo8ndQmDbIb5TMTcGwLXL+X+54h0tLh8SpMK4Mq7cdJbXreyj
         lyV/hH7GSSpjHWdcllxL2fR3cB9ru6eFpplUh1BSYYH2+3r5i7XCIpO9RNZdmC3PlYRz
         aPMlz7EyC5OqVFp9urniEMBSaCwuCc/nEp6vFJiBInRC0zeCRLMCIO7XKfnZx73Sve49
         7vlH3D+I0SYylSFIFfGU2eY3Cb0dQQejBiP8j7M6Qgm3108VVsIFbpXKhbNcOwrtqIyH
         Z0Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWZxGs3LN2nCwoPuOXPKUhiejikJh162gifT6keXBAa4Jz2bba7ZY0y+BQb6egHm0VmIdv3xMOjzJdgWPMnco/2@lists.infradead.org, AJvYcCX/oOf+5ZhhAL6bvUsDMhMSJgiH4iV8Ui3qo1vqSx9kka9L7umUBYtK1as5d9SafWIitsCiEqOIAMWGJCH7iVE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCEqsJt8lWaOidNgi5OWfBbtn7ApG0HYuvrE2AMT7bC5KJ4NN/
	E03EWRbXk0DEZue176HKow8WRzEU1JUWJ1beQVbjc5sfLziyDZrI
X-Gm-Gg: ASbGncsescnPZCkhJSIHzQun1zPb0JHORfsliCLL9mHKgoO3MXozeO/9gp7jvoQ8ckC
	G4+63EHRE/rrwiPOB95tzy0G/UUUAdetSU+7Zt3sNB9/5u6aBIAG2CMJx5sWd2v4kC2MJIMZMaP
	6wNr8zCD0PSvDQzSzOrd363cZQ0lSzSPMkysGcpyVdggtds/nAFuAvvTUr8idp/9RQU4sDWcSFn
	x3RaOZzBSG9MU6h2HWcOTe9EhNf/zMdh3G8K/V/lr5Qm4+8wBRlwFGeUwqKfgQ3Et98nh0IOcLs
	7fDYtsphze9nOwM/mFdzTUOnl+qhV+o2KFAoT0W451GH8Wb7ZNBgTDB2XFU=
X-Google-Smtp-Source: AGHT+IEr3FTDT7SjKLFcV/86PKpmd1Ulc9pLBA2vnFIK1IvijuUo0pqO49m1oZQlx0sqziOn6memSg==
X-Received: by 2002:a05:620a:4448:b0:7b6:c92e:2e6f with SMTP id af79cd13be357-7c047c1b895mr615602285a.22.1738946881480;
        Fri, 07 Feb 2025 08:48:01 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041ed0304sm208492185a.115.2025.02.07.08.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:48:00 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)
Subject: [PATCH] thermal/drivers/rockchip: add missing rk3328 mapping entry
Date: Fri,  7 Feb 2025 11:47:40 -0500
Message-ID: <20250207164740.14475-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_084802_710551_B1C893AE 
X-CRM114-Status: GOOD (  10.11  )
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

The mapping table for the rk3328 is missing the entry for -25°C which is
found in the TRM[1] §9.5.2 "Temperature-to-code mapping".

NOTE: the kernel uses the tsadc_q_sel=1'b1 mode which is defined as:
      4096-<code in table>. Whereas the table in the TRM gives the code
      "3774" for -25°C, the kernel uses 4096-3774=322.

Link: https://opensource.rock-chips.com/images/9/97/Rockchip_RK3328TRM_V1.1-Part1-20170321.pdf
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 drivers/thermal/rockchip_thermal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
index f551df48eef9..a8ad85feb68f 100644
--- a/drivers/thermal/rockchip_thermal.c
+++ b/drivers/thermal/rockchip_thermal.c
@@ -386,6 +386,7 @@ static const struct tsadc_table rk3328_code_table[] = {
 	{296, -40000},
 	{304, -35000},
 	{313, -30000},
+	{322, -25000},
 	{331, -20000},
 	{340, -15000},
 	{349, -10000},
-- 
2.44.0.501.g19981daefd7c


