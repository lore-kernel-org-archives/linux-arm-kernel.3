Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D5ECD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 10:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsLx4bLcrGyoqVnXullJcUuE24/W5Ky1bmDAk8PXmPE=; b=o29zJSbbRCoVmpX75vr8cirwBg
	Wwc/5HT0hqSiRLwK2Xd1utVB46fF6xkVhE4QI7fXxGc5LKt999svUtYLV0lbxqbbGBzopwwK9Sgl+
	ym4PCVhaceXXGdhmm9MVF1c9HtxrNZY0qPeYr53o9CLq5frPOwcQ+xdDpjUcf8Ofnn/aUltRHFtRq
	7+nEnDqcMMg4UYIr/he5myXdqaljzFZHqcBFDWZrOS8VhOUSgdhtUr51HBxTVV6wfyW0MT38OPjeO
	cvDey5tTbyqBffeZOFAmQ1+lLHYlkvr2GxrGYXIPhI3A6C9uARJWQecOBBeTyFZtC2kdFUfC5V1fs
	qq37p/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVRsR-00000000UN7-3DPm;
	Fri, 05 Jun 2026 10:34:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVRsQ-00000000UMy-1G4K;
	Fri, 05 Jun 2026 10:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gsLx4bLcrGyoqVnXullJcUuE24/W5Ky1bmDAk8PXmPE=; b=W1GZcH193EwhvZ5oeyMJk1WYnj
	bHua/zJrdtINr7KyOabLwykob8xwLI0wYXz8PBfULNPd12MbVWWNlcgGXu6xtpli3gOUWU1dgyB+G
	UtaqDyp1AxefBsvsiHtEknppetWskjB9ZRLwLweB8m4BedCQOwKtGtdAwoOpqJ23oIXZ/Cbs7OJMS
	uWCQH/Nh4Vps2cHvhxbuRiNNU0WjCsOTsnwsF/aA72enr0otofcnMXjcdCgNmxzbYAIdTwu5bC97Y
	PUVgvNDBs75FiUwZoqypidcVZxjH13tHJC529u9Sc1bl3S0fMFhj55Jk1IzxDzu2T/XNr6bKzxPZ5
	1ScTewnw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wVRsM-0000000FSYm-3lMb;
	Fri, 05 Jun 2026 10:34:09 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 655AXs2qA1322837, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1780655634; bh=gsLx4bLcrGyoqVnXullJcUuE24/W5Ky1bmDAk8PXmPE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=oJY5wjN7bM9oUfqJle0ebjh3l1YlWczzYm8LrAyhAkd363CzYgkbGCx4ZJhp6m+dB
	 p3UQWSqNijs5R0QuPRUc70zNJav7L6t4gUXlVKksaJpxSBaHBDhk8SUdXTwaB6x9uV
	 r+fBkUZaJb+i70gmzPvSVA0TNHlWEG+pjCJZvbwEkhdpIbivlXuHc7CgYLH8JyJZWY
	 E++KAtERDTMIW7lzFXeDKE/MZ0j2jaI8aYm6t9T32kvngfVTkuvTatDskcBsXrt8Ug
	 keO0tQyjI5Y1B3FPLxDYaccZ3o6ZKaRFLSq+gKsua/jLu/gz1h9IHkR/80B+e6I5dv
	 JOT0UtRHOXzWw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 655AXs2qA1322837
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Jun 2026 18:33:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Jun 2026 18:33:55 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 5 Jun 2026 18:33:54 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <eleanor.lin@realtek.com>
CC: <afaerber@suse.com>, <bmasney@redhat.com>, <conor+dt@kernel.org>,
	<cy.huang@realtek.com>, <cylee12@realtek.com>, <devicetree@vger.kernel.org>,
	<james.tai@realtek.com>, <jyanchou@realtek.com>, <krzk+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-realtek-soc@lists.infradead.org>,
	<mturquette@baylibre.com>, <p.zabel@pengutronix.de>, <robh@kernel.org>,
	<sboyd@kernel.org>, <stanley_chang@realtek.com>
Subject: Re: [PATCH v7 00/10] clk: realtek: Add RTD1625 clock support
Date: Fri, 5 Jun 2026 18:33:54 +0800
Message-ID: <20260605103354.1743637-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260508111641.3192177-1-eleanor.lin@realtek.com>
References: <20260508111641.3192177-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_113407_542056_36D127E8 
X-CRM114-Status: UNSURE (   5.22  )
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

Hi everyone,

Just a gentle ping on this thread.

Although I haven't received any feedback from reviewers over the past
month, I noticed that the AI robot has provided several helpful comments
[1].

I will address these issues and plan to send out v8 patchset next week.

[1] https://sashiko.dev/#/patchset/20260508111641.3192177-1-eleanor.lin%40realtek.com

Thanks,
Yu-Chun

