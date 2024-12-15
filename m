Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFFEE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 17:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hoWxhi3JORicDF8EOtVlvP1p2fxXMM/DQuMBqRFDh7c=; b=etuDAlRlZ+a3xMz37EHYjw+Ozr
	Q48baf3bXj4wEWQ+0LoAH8ZkECl7/tb+DCKWv7YtfdP4HfAgsGpSWu1hduWF36EJZFyTPsV6t00CT
	ZuEIVlHOrklg9qO3+pTIgqO79lbSfCy0P7dXvleo1LnOT99hfh2bFeWipJEEYVawUDmtZCFcDMnsK
	zVGksdZnBkoNnADwHR9EAxZOmUz6iaXA3JoX3woODBcYaw5ZJqLq3yTRkChSgd0ADfb46X9v5QMrv
	ktUivSXgVpFlztDD9vtOhgPjEyrHU5RbiKt2O6O2ZiJDEGax8unSPp3s95WQurqClkxgtrEYQPGic
	RBstr1OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMs9G-00000008CNH-3jnf;
	Sun, 15 Dec 2024 17:11:18 +0000
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMs8A-00000008CHD-0mg4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 17:10:11 +0000
DKIM-Signature: a=rsa-sha256; b=xAdJlwWGZcpzPGneW+nYOyAW9OLBj2j7IBzkaWPLPnPmri/9zWDy4SkkgdURob0ippmICXsv4ZOMP+sRj9+9BcEPOI4Zu01Bbrga82UJ8Bca9c9pOdESxv3pMZ/Q07j5VAYSRD8NTLC5ocWaVHiLcDyzxRSpsGZyvRjcKo0ewgTYb1YPOoAV+lEOeFYBB8QFLnbdaICJrV8vC5Q+et6jWahpxVwZLB6IuqBoZt6YN3hNxVd2kHY/8H2EvKUrUZbqtl6qlsXMhlhSGIUdquDKXn8Lf/mTgh1u/UVT/+CsTvlu7LyLiDHn7gM6JAOWSg3AOJkpABm4F506yYeSYFSgSw==; s=purelymail3; d=purelymail.com; v=1; bh=0+g+RK4mm+gXK4FknZi+afJu+Pu6+v4iIIJSvUsfP74=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1363280443;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 15 Dec 2024 17:09:54 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] arm64: dts: exynos990: Add cmu nodes
Date: Sun, 15 Dec 2024 18:08:02 +0100
Message-ID: <20241215170803.1756850-1-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_091010_319340_978639E3 
X-CRM114-Status: UNSURE (   7.01  )
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

Hi all,

This patchset adds device tree nodes for Exynos990 CMUs (TOP and HSI0).

This allows the first two implemented CMU blocks to be used.

Changes since v1:
- Fix clock-names formatting (Thanks, Krzysztof!)
- Remove stray blank line (Thanks, Krzysztof!)
- Make clock-names conform with the binding style

Best regards,
Igor

Igor Belwon (1):
  arm64: dts: exynos990: Add clock management unit nodes

 arch/arm64/boot/dts/exynos/exynos990.dtsi | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)

--=20
2.45.2


