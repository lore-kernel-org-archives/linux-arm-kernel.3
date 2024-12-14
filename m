Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B12E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 12:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4QFoBSatMBjsyVLY9AOehxvL4QA7cvu2OCdTf+re26g=; b=Xta0ve0dliUXOO9VMu3MQQNb1L
	yHFMB682oRqdp5rZ9EbRYz9zKyONzFlcsyUMTu1vICSzeNOcR0UcECGxiQhhDqiLuVTNA4dKCgA51
	0/3bceyEqIyXBlQu3zqHvK2eZMwkGyzrqCfHFgZBQUMPqG3Cvf0fNtKqa+aX1WvTD1quRh2Hn3lDa
	OClW8LRV5ARIiI/V/qNtGOdTNOHpHBbeRiiHC/zVvKHBR3jLb9rAzKB0YiMKzIFniQZHIot1o/d0/
	BJgO1FNU0W4re6dTTcbnE+B07pfJWqYq0kIL8zdtMU13GlZShBFXjxtLaXlZTTtQ+CZyA7E4GbMA+
	/CasL6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMQr8-00000006I68-1zdc;
	Sat, 14 Dec 2024 12:02:46 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMQov-00000006Hr6-3twz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 12:00:35 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=RI1yoT5kvuyVdZxUgRkJ7lgGLvj6bbZedA2OR1KhcLFCodlvHEUouHgtcaJQt44E46FMBXgd1rrd3j2PsFPFoTxRG/8b6PhftLaPgsfyV+nGYMyYDAjze8oroC14Er+8BGXJz5Pg9df8CNqIn/duGBzef2t8GmPJ16YzP8sX7doYxZVPE68Ai8SjOgAfy7hta2QEYkF8NvERQCv+c/yVPeu/7+gRiDrJOBr7V6CSD86ejxlHGBeide0tI3uFcld04QEdu+nTAr1Pdtn7dbjK3p/+Y44paomPQUZmXxzIyHlEHVwX7RJaQ5XJuu/rMdto5inSkArQFpeC0HVFc0G+zA==; s=purelymail3; d=purelymail.com; v=1; bh=tYG9ihl5L+qiU8A5BMBzAn0oMBT4lU9q+EivAoC0UmA=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 770029855;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 14 Dec 2024 11:59:05 +0000 (UTC)
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v1 0/1] arm64: dts: exynos990: Add m5-pmu
Date: Sat, 14 Dec 2024 11:58:54 +0000
Message-ID: <20241214115855.49138-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_040030_055318_17EB797F 
X-CRM114-Status: UNSURE (   7.05  )
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

Hi guys,

This series adds support for the mongoose cluster PMU in DT via
a compatible for it that was recently added.

This change was tested on my Samsung Galaxy S20 5G (x1s) and is
confirmed to be working.

Kind regards,
Umer.

Umer Uddin (1):
  arm64: dts: exynos990: Add a PMU node for the third cluster

 arch/arm64/boot/dts/exynos/exynos990.dtsi | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

--=20
2.47.1


