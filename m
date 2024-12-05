Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524EEE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 19:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZB2ZD8newIecgF9YojZivONnPnrHJekLCe8GgtmLrQ=; b=zYJJP44+YY20yk8kQumJa52Lha
	YbF+6Iuc/PYgtjabMUr/l8SeGpLTSgRsttSJtJ3Sbz9yuC939SfduPBnOQ3rmWU9bOPshAdisn7Gl
	Ahb6pVwJSWSKOISIAdXSrlxFbIQSjECmP6gH/E5NPIPGD+Y8k3pPKJcD5v5SfbGykQWbNldqdEWk3
	eOtVtzbQCr8CVldLQnAgsvP95qcNnDHUI6A+9oFJpJtkmEBxd1aL86MYmWEMnGPJPxqzCOI1Z/abd
	JW9nsYMUnUAWPM8PMJf8vbc4yqJ3XXoQ2wPAtAsxcvcHxUdIZrXw0FymOzn3ympAD4aiqecsX+pwB
	49gOclKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHpB-0000000HFLo-1jwo;
	Thu, 05 Dec 2024 19:47:45 +0000
Received: from out-03.smtp.spacemail.com ([63.250.43.88])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHo9-0000000HF8z-1vyW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 19:46:42 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y44dr5J0LzGpBc;
	Thu, 05 Dec 2024 19:46:40 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y44dh2ZxXz8sWP;
	Thu,  5 Dec 2024 19:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733427995;
	bh=rZB2ZD8newIecgF9YojZivONnPnrHJekLCe8GgtmLrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hegvWNRZU5ZFZpW7KcC7fxBgIuB3Gotjw80+pfAtWdtzl8/sBSLGgSjEd3WT26LX5
	 XJIUhw1rWmeFRFAY07d9Aw7aqGsMeshGivnvs6kvE1f2TZi+VhkrRjVAW+orLIZTZr
	 17PXlwXgff/Mu7XosYdK7Lqnmq+Eg/FwWiHZ0Vp/u29dVJpNhIL3l83TvFTW8lWoTR
	 hmz6chUC/Tgj4rHiUvhxGgIsE0mjs6pRFEV2uMYsRVbnysJBL2jJ7YsUXl82WFov4T
	 rf1N63jOr3/5ziMlHOcZNqC9vxsDq5sb+tWQ52x74WFk/PX3Bp7rvNcHrKFyP/M9Fd
	 zg1jeniAJL4HQ==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: igor.belwon@mentallysanemainliners.org
Cc: alim.akhtar@samsung.com,
	conor+dt@kernel.org,
	cw00.choi@samsung.com,
	devicetree@vger.kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	mturquette@baylibre.com,
	robh@kernel.org,
	s.nawrocki@samsung.com,
	sboyd@kernel.org
Subject: Re: Add Exynos990 CMU support
Date: Thu,  5 Dec 2024 20:45:10 +0100
Message-ID: <20241205194510.786973-1-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205193423.783815-1-igor.belwon@mentallysanemainliners.org>
References: <20241205193423.783815-1-igor.belwon@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_114641_516648_2F663D0D 
X-CRM114-Status: UNSURE (   4.86  )
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

I'm terribly sorry for the garbage as the subject. It was my editor adding in
some cached metadata(?). Will resend this patch if deemed necessary.

