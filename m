Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE77DCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 18:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85aBEzzLdnSG7SQA9aPsSPLwJXCmq5FIRWA2XNm4m+U=; b=PewRueYM7HMRX/o4K92KkdvwJg
	bldM/IdpRkj8ZMr6zcAg+zNRDqX3Vl+/4+eOVMfH4HR3pvvin7TTx0jQ6z2Qu2cUUwR2Qn+vb4SKQ
	qrsvja6gQhhWDFzWKrRaV955aqbe1epnx/YgEP8p5/ymQ0aXkw5b4+htsMmsxGFYnJKXb636OrVpy
	B98a9ia+6g4ReG/B5vecf0LM+rTMxDDfY4RBHnuk7iEfJQhUA9LcXeSQzYss2ZFuTA6+WRp/itHMv
	6k2TvRr8IMfI++LHu+P1OF3IagXxoZddqq3rXbC8y5JRNiVJorQ+mjxgFTU5/A7Z/wyqJZ/jbke0M
	wYX9GsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKvS-0000000HEJ7-1kq2;
	Tue, 05 May 2026 18:55:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKvQ-0000000HEHQ-2wnv;
	Tue, 05 May 2026 18:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=85aBEzzLdnSG7SQA9aPsSPLwJXCmq5FIRWA2XNm4m+U=; b=MuV2gijYWxbvj+WXbMgFttTfh8
	6XX/os3ssMSm5QsEpH97f/FqBouV+Dk3phRjVSZt+eK0C8eU4GJUJGqJY55/RjMwKfE+5KPrjG6Ov
	JSe8i58My0rr9oX2n6gDqwIWKGjl0G8SV4601mISeSL9Wc1BRKVCJJl8QmI45LLG2n2hWsjxXWsPj
	aIwffOICUkFHIiG0QMjZvkXVbBq/glhoaJ+EwKrXlWJtq1sslIZN9xwldI8bIx/jaFyfaORaFDau3
	t0kjtD/7mLDCPcmZZmx4S4bkXtqyJswPmevtD9mCaDe3s4XQHcSEPtBjliVCKL4VpDmhSxnvWqomg
	qx5lyYOQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Weixin Guo <2298701336@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	f.kardame@manjaro.org,
	pgwipeout@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: fix rk809 interrupt pin on rk3566-roc-pc
Date: Tue,  5 May 2026 20:55:01 +0200
Message-ID: <177800729424.3301010.8355730425326488875.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <tencent_5035EEE630C845B1B51DEA4284DE23DCCE06@qq.com>
References: <tencent_5035EEE630C845B1B51DEA4284DE23DCCE06@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_115520_742925_A691497D 
X-CRM114-Status: UNSURE (   9.41  )
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


On Mon, 27 Apr 2026 21:58:04 +0800, Weixin Guo wrote:
> The RK809 PMIC interrupt pin on the Firefly ROC-RK3566-PC (Station M2)
> is physically connected to GPIO0_A3 (RK_PA3) according to the board's
> schematic.
> 
> Currently, the PMIC node incorrectly specifies RK_PA7 for the interrupt,
> which prevents the PMIC from correctly signaling interrupts. (Note that
> the pinctrl node 'pmic_int' correctly configures RK_PA3).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: fix rk809 interrupt pin on rk3566-roc-pc
      commit: 460bac478c5fe69054ffc60d607bba03bcaf909b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

