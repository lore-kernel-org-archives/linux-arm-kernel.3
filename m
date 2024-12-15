Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDD4E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:Cc:To:
	From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=IjCZolz5QihZwDaCtI6RD1dw0ckFGtdFRN+BW0DQV2Q=; b=rpYnpiSK9Vl6KWfEqMBHpmeu4J
	7od0FkPB2XEQtkqNK0xYU4fm3AT/HvhhTKY/GZyQOKMO5GhCMKKB8yIhrB4dt3UiYzMjgD3kkJa1Q
	3zPxpMkrQxdq/LCFUFk/P5dIO2wA9wrNsiUHfOSGqVeImDuWpVTRNdezP8eYTRTk2Qlp25naC3SQz
	YPJ8lNxy3EEaXoGezBg7HKsC+eJ6fUklei5xQUeBydpitHJNc6PhMg+3yTwMUGfCLgzki8n0o8Ina
	Qr5KdKtH+KTuGgSaCZAPhCPXhRSK5+gWENeocZ86GtLXMI6u5GYy8btojWE9IMUqMsfYhZKkdSQtC
	NoJBft2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMrbb-00000008AiE-2A9S;
	Sun, 15 Dec 2024 16:36:31 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMraT-00000008AWD-07QX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 16:35:22 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=ZBTRGbPSgOJGQheJaz4Lyxl+8+Xn+AIgsDscThWDQDj+3T2bLUkLEjzbi5z5i097biiwuZ6gxBIgSnfmgyG2SFbSmgVo/R1ichpwR+lFje1V2l9rfzF3WePDnCLHBkJfyYFP9SaQGuP7YC339rHDm0/E+hG+mZOLH9Vq9njqBCq6QWmwu5WV49lLEPMUCcgTX7dY9mb3LJBFii4oUbg2F6kUfyx/cUQP+5v8r6SSAdBFIOXMmZ+1cUQmPX40q3trTbY9DDPEyGkyLNJ50yHtU414khoCnaAFdUZu6C3uFD70YbjD7/adx4sTUNzmXCzsNfuVmhbXOQ9lEgMaTb0mHw==; s=purelymail3; d=purelymail.com; v=1; bh=IjCZolz5QihZwDaCtI6RD1dw0ckFGtdFRN+BW0DQV2Q=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1641233317;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 15 Dec 2024 16:34:51 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Dec 2024 17:33:21 +0100
Message-Id: <D6CF3DHQWEPR.3J1JM27L0JUKO@mentallysanemainliners.org>
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: <umer.uddin@mentallysanemainliners.org>
Cc: <alim.akhtar@samsung.com>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <igor.belwon@mentallysanemainliners.org>,
 <krzk+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <robh@kernel.org>
Subject: Re: [PATCH v1 0/1] arm64: dts: exynos990: Add m5-pmu
X-Mailer: aerc 0.18.2
In-Reply-To: <20241214115855.49138-1-umer.uddin@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_083521_199917_8634754C 
X-CRM114-Status: UNSURE (   2.80  )
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

Hi Umer,

Tested-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

M5 PMU got succesfully enabled on c1s.

Best regards,
Igor

