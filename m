Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37092C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 08:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U1GZt0j74cjZz+4xaSGSJUjZ7iEQo5EUR7q2Tuw3IYI=; b=HZGV9zl+Cd7j+pody5u+vDA4Ad
	fotLWeJusNlnNG28oqBsAg4Z7J2cx0/mKQgECCzAX9PZgTj78OOjLIo2YuJfrdhQVvDYx33Y8BDMh
	d4OUx/tuSf1EMlfQj+0ZsrnVc2USlk0KYfjUi7nRy7POMfhnlIDkC2DJSOLz5TEBnBRNkgYdEqF16
	PvZDaQtTWHwFlTglz54yZpsAQsLIv01Hkj0vFeoSkVizu6le5GQ92YK7of7viUI7grJ/MQcA+FrQi
	CQTjBYi1BMSILMxX+ZUlpBVrlu41V0xpq6CJo3rxceQKRntS5M71r0rW1MN9I9WXtA3V9j3lFBRQw
	eVQdB3bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xB0-000000039fr-3ysX;
	Sun, 27 Apr 2025 08:15:51 +0000
Received: from out28-133.mail.aliyun.com ([115.124.28.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vqg-000000032qj-21SD;
	Sun, 27 Apr 2025 06:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=coolkit.cn; s=default;
	t=1745736639; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=U1GZt0j74cjZz+4xaSGSJUjZ7iEQo5EUR7q2Tuw3IYI=;
	b=eysZYEVzR6qWOKfI8KgDvn7i5TI+OenSBv8RY/z5uHmKtYarBL4JxYbXyXAon6aZYIaJzbn1LTU4S4CgGMcFx8feJn2LyFZfIH3B05KLfWHwj1Fl0C/HctTRIeEFQvUrew8HdflxuVcAnxTsdcGKzpvXS825aRM72Rra0dqbJq8=
Received: from ubuntu-z.lan(mailfrom:hao.zhang@coolkit.cn fp:SMTPD_---.cY70L4K_1745736637 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sun, 27 Apr 2025 14:50:38 +0800
From: Hao Zhang <hao.zhang@coolkit.cn>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: ARM: dts: rockchip: Wifi improvements for Sonoff iHost
Date: Sun, 27 Apr 2025 14:50:12 +0800
Message-Id: <20250427065013.99871-1-hao.zhang@coolkit.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_235047_035878_4C2F36AA 
X-CRM114-Status: UNSURE (   3.28  )
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

Hello maintainers,

This is my first patch submission for the Rockchip DTS files.
The patch improves WiFi stability for Sonoff iHost.

Please let me know if any modifications are needed.

Best regards,
Hao Zhang


