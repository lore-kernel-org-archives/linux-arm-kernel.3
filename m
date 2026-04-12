Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD3EF3ED6D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 03:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jhS54yxvdJ/eb9t7hrykw3sZcbqh+mUbA1diMqvvVOg=; b=0/iyVbo/o3KLmM
	eQ/5JNmayJ8GIsIoMEsYXZ65YJt9IXMgxVZaFnxpLPRhyszI61O183wn4EZsR5uV5BnuDIAXXyU3o
	Ya6GL+mhWZ+4CzM/8Rz6veR6HSmCmQctnLk8IOJ/7vSAeBSjwcuEdGfO5NUzmuHh5Jonuqok53NYS
	vbK0bk+4H5vhHXIU0dMKtnuJKv51GxoRqyeum1PiL2XeW3Cw2/A4hm3VNd7JMiSQNiRyoTPZgbERt
	Fu3HJ4vkETveUYA3T27voVveKk3XyosFJy2l9a3YTHljbwX/jwqWv3TtmeCvkfu0ZEaE13OWIDBf+
	cV44oDrcRkAfd5Ktty2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBl8W-0000000Dzfh-2Z0k;
	Sun, 12 Apr 2026 03:05:24 +0000
Received: from usb-smtp-delivery-232.mimecast.com ([170.10.153.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBl8P-0000000Dzey-2oNg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 03:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hireright.com;
	s=mimecast20230202; t=1775963116;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=jhS54yxvdJ/eb9t7hrykw3sZcbqh+mUbA1diMqvvVOg=;
	b=QivAq0nNICMlubQ5574JzV+MZ/SfcFiKv5xE2VL7vdHCPrQS9ObBC9phanWCODlIQaizna
	wa45VxT1VK3uVO8tEygJIykb6mY58tiKWELBX2q+pKYaK5iBEf753M16QHdcVzJclbFQLJ
	RJqPPNOzu6Q9GPQjj9PT32m4Q78OLkg=
Received: from us01wexc04p.Corp.HireRight.com (199.255.140.17
 [199.255.140.17]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 usb-mta-45-PNK4MzSBPTu0aJ4ccyILxg-28; Sat, 11 Apr 2026 20:03:43 -0700
X-MC-Unique: PNK4MzSBPTu0aJ4ccyILxg-28
X-Mimecast-MFC-AGG-ID: PNK4MzSBPTu0aJ4ccyILxg_1775963023
Received: from us01wexc04p.Corp.HireRight.com (10.130.12.248) by
 us01wexc04p.Corp.HireRight.com (10.130.12.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sat, 11 Apr 2026 20:03:19 -0700
Received: from hireright.com (10.128.20.12) by us01wexc04p.Corp.HireRight.com
 (10.130.12.248) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sat, 11 Apr 2026 20:03:18 -0700
From: "John Lucas " <zeena@hireright.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Questions On Request/Partnership
Date: Sat, 11 Apr 2026 20:03:23 -0700
Message-ID: <20260411200322.7D9C7765FE0E2691@hireright.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 8
X-Mimecast-MFC-PROC-ID: I6PWCvXOmWje7TteNe9_U6jmiiTCqQjsuLtqTJ-YH8A_1775963023
X-Mimecast-Originator: hireright.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_200517_807947_0294BDE5 
X-CRM114-Status: UNSURE (  -1.17  )
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
Reply-To: jonlucas2104@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Greetings linux-arm-kernel,

I hope this message finds you well. Kindly confirm if you have=20
received the loan offer letter.
The company has a large portfolio in Eastern part
of Europe, Middle East and Asia which he earmarked for
investment.

If this is of interest to you, get back to me and I will give you
further details and my personal information

 I will give you good news immediately as soon as I hear from=20
you. I await your response=20

Warm regards,
John Lucas
Financial Consultant


