Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3687DCED617
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 12:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0UK7D7hfRYPA6PYQUa2Dx0DF8D82pW5mt2sd7BW4nU=; b=S8muZ4kc/u7VtwsmU3sGcgRiyB
	NS6xz//4/mwg2HxIl0c78TWqXskV7eqkHpLeVq2Em/2ezB6MQK/uMuqERxvFu3RRIUp7ge1cYDLs8
	Jf6gXembR+KqZUcYHxJ7b0GYn3UV8TbglyW6cBaiQNbuRqXIzW/jxtBkYM1jMyiQT1chZzTXdy8Ki
	eSIu7+sN5+toHD1ReTF4AOo4wWXDRWGN5vT2cVyW1KsMHfgLPwgSQEm2ZhOLxWk560+orVW/KO74A
	8DMlJExqqNxll8xZGGOITgcyjLMK+pM49bemCk70BM1tqrWHNDlGWxUfShst/42/HmKu3EUs+FWTB
	zS1LgDgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKV3-00000000Nqf-0Itb;
	Tue, 18 Nov 2025 12:07:57 +0000
Received: from mail-m1973199.qiye.163.com ([220.197.31.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKUz-00000000Np1-3lHj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 12:07:55 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29ffcdd1d;
	Tue, 18 Nov 2025 20:07:45 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: arnd@arndb.de
Cc: yangzh0906@thundersoft.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	soc@lists.linux.dev,
	ulf.hansson@linaro.org,
	will@kernel.org
Subject: Re: [PATCH v5 0/6] arm64: introduce Black Sesame Technologies C1200 SoC and CDCU1.0 board
Date: Tue, 18 Nov 2025 20:07:45 +0800
Message-ID: <20251118120745.2480682-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031045253.789621-1-yangzh0906@thundersoft.com>
References: <20251031045253.789621-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a96dd212909cckunm5c4ae9aec236f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHxpPVhgaTk9CHUNDGk4ZT1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=h4TgurKpjh0+KCb9/AYKYVSLvcM6f0LbHBzBTmLGhX90ZoCGqOO1OmT197YUkCyCnNEE9b0AKgdhWkZjBDzgrqNnCtzvuHCozeE34wzR7I0U2SYixGWhmT9etr683/pLSPZN5f5XP6z+BqWurh2A6bAR16bjpI7IOm6Tkaq/Vas=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=R0UK7D7hfRYPA6PYQUa2Dx0DF8D82pW5mt2sd7BW4nU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_040754_441138_2CCC0F3E 
X-CRM114-Status: UNSURE (   7.07  )
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

Hi Arnd,

Gentle ping on this series. I sent a follow-up two weeks ago [1] but 
haven't heard back yet.

The v5 series has the necessary dt-bindings reviews (Rob's Acked-by 
and Krzysztof's Reviewed-by). Based on your earlier feedback [2], I 
understand this should be queued for 6.19 after 6.18-rc1 is released.

Is there anything blocking this series, or any changes needed? I'm 
happy to address any concerns or rebase/resend if that would be helpful.

If you're busy with other priorities, please let me know if there's a 
better time to follow up or if I should take a different approach.

Original series: https://lore.kernel.org/lkml/20251016120558.2390960-1-yangzh0906@thundersoft.com/

[1] https://lore.kernel.org/lkml/20251031045253.789621-1-yangzh0906@thundersoft.com/
[2] https://lore.kernel.org/lkml/09b1318e-21dc-4354-8733-866b70696295@app.fastmail.com/

Thanks for your time,
Albert

