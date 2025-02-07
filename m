Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973F9C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/93fpw68fWcW+DcrP5O/aiX1Id4V9BT6qntICk6OEis=; b=PvdzgDfRSCpfrWUi+z93BfNJPl
	5B6VdLtWsglt7kfmFzSl+B36uZw8W4rpo527ljMDLYJmnqWUR/+eMvIfZemITlVP8Ao85G+StzC6i
	09Hu/4urUBRWBwwUz/xeSB4y037yb6ekQVlJ6+A929Xo+rbkZVtr9HL3xdoDDtKmPcuPJvTRjs9OX
	OIZp4wkeu7uzAqJRFsA4QRicua/TnfL7OX/UOwKc3y9G/DuRjcsYnc0dVapEi8chl0cGWDPHXWkaH
	imrPaDdjOHAbbO+mqAv2ltH64p+M/4ElKFMKmQ3c/8qTe/T90UZI0GMgL0H/mOHLaUSC065o8b609
	lv/cR7Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUyj-0000000B40c-1juh;
	Fri, 07 Feb 2025 20:29:33 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSVS-0000000AZAY-04fd;
	Fri, 07 Feb 2025 17:51:12 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7b6f75f61f9so347801185a.0;
        Fri, 07 Feb 2025 09:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738950669; x=1739555469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/93fpw68fWcW+DcrP5O/aiX1Id4V9BT6qntICk6OEis=;
        b=nJX2AjX56KS+WSmsfEs8DV1Lhf05XrTuyr6K7/XUSP/wZK8XUSiH6ywWoOfjo+psAT
         BZEKyk1GYN+gvOl9lkHosxGdHCGiQP/3h530OTO7aIcPat4eCXUkNqYYIwY9pjOy0jW7
         H8i/pTwkHPGmZTPuiqWL5N0kglPsRHLMvFhfWUKDZFOuuKYzObEC1wRXFsl6Q69seILW
         Gdhgtxp81J0Mxm/S/6Amf7xlowhz8OB094DNzniwL/Z8xcsQlt1vKJh4GTG3hQ7XE6Sj
         EA1JSMIIjYGiQ+26Na+eM+ZBaAqUjPUC9w8+ln7aEwZHPmrrVEJU3HAhcSw/RC+/KS7+
         JLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738950669; x=1739555469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/93fpw68fWcW+DcrP5O/aiX1Id4V9BT6qntICk6OEis=;
        b=N4jRn4IBjXyXn/T5H9eJEkb23TSZgI5Ff8zffsAkZhBLPB3pLKZc2Y2LI8c5A5c12V
         5Mqhq4GrseAHess/pWCDNLxr3svKwnU2kSjQ1zpYTUcnS1Vswo2GIw/3trcHkfUyZl8W
         xTIiCOIlVmKGOtItyQNfXhWDvSp8GMzvqD+5PAta9QMkNk2kyEz8+2929S6/F3epUTOD
         0K6KJscwZ1cHW3s6pRi1LXuGmjQRMaBrqFInyp6WrvVn3fuYBWf9BxK+mMB9Xgem0j/7
         KdkRghE7BwGUkc88X71/CpxRf2EnKqBwHR5/Sw7QIea8zornuezisykb9zCtsenGjypq
         +GRA==
X-Forwarded-Encrypted: i=1; AJvYcCVrExVVJT9XYTxHmc1JXJ4NHE8pMhFBJbLzIxm5qUhFjcVHr9Er5LFe86gst+5UeNCVDPVxz/mVbPqVwWyQLDpq@lists.infradead.org, AJvYcCXiiNVyT3oLRsbk50tEtWSRfR04C/uUUV+CPrklY/EgFZZ7o/upGJLgt3nqr04UCyJ9U3o1GBoSfMcUS1WqEAs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd+rk7WNWmy0OZVYsX5U11JRDxlyFoPFKtKxtmDpnyUc1wn2iG
	yI9Fr0pKAz09QrNagwPFFkfnP+mVWLelBF+NbEWHX/K07dbPnOYx
X-Gm-Gg: ASbGncsOUXDniqDq4g/uIvR0kEtNUVORqpLsK5ZFIlX1HU8RsKEx/ePQYp1jjeii6iE
	sraM9l/Kaj9mCEdbysT1Avw9VAGz3DkBg2Z+htr0XuSVUrsrc6+0s4uTDlZ+Gi5qRk9sGsAcAcE
	n0CuCn2k1a0431eT3phALtP62a2n6LdaOwZNJyqt04Q9dXLWbUp3sbD/AGJoaQc3s1k8eS7uDAb
	zHWU9DKRM/eNfTy5CoLRd/ilujlpVFyFzpZuXV+B3IopC6fGdiA2w22DG+TqKdxg+ZbJVQmzTo2
	Z/aCkwwngvorDLWHfTjrk8V6d2pQRGeuzNtv/alLAuI3OAeg1Pz7dxfVoEM=
X-Google-Smtp-Source: AGHT+IH5tTCU4j64XQ4F4wjfiG3qYOH2jmpjJmMKHXE/ZZKsEer/8T4dfoO0EiAxA0tixUxKnduYEw==
X-Received: by 2002:a05:620a:f0b:b0:7b6:d6ff:86ba with SMTP id af79cd13be357-7c047c4acb2mr596123985a.52.1738950668737;
        Fri, 07 Feb 2025 09:51:08 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041e9f901sm215674785a.87.2025.02.07.09.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:51:07 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Caesar Wang <wxt@rock-chips.com>,
	Rocky Hao <rocky.hao@rock-chips.com>,
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)
Cc: stable@vger.kernel.org
Subject: [PATCH v2] thermal/drivers/rockchip: add missing rk3328 mapping entry
Date: Fri,  7 Feb 2025 12:50:47 -0500
Message-ID: <20250207175048.35959-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_095110_054851_55FF488F 
X-CRM114-Status: GOOD (  11.57  )
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

The mapping table for the rk3328 is missing the entry for -25C which is
found in the TRM section 9.5.2 "Temperature-to-code mapping".

NOTE: the kernel uses the tsadc_q_sel=1'b1 mode which is defined as:
      4096-<code in table>. Whereas the table in the TRM gives the code
      "3774" for -25C, the kernel uses 4096-3774=322.

Link: https://opensource.rock-chips.com/images/9/97/Rockchip_RK3328TRM_V1.1-Part1-20170321.pdf
Cc: stable@vger.kernel.org
Fixes: eda519d5f73e ("thermal: rockchip: Support the RK3328 SOC in thermal driver")
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- remove non-ascii characters in commit message
- remove dangling [1] reference in commit message
- include "Fixes:"
- add request for stable backport
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


