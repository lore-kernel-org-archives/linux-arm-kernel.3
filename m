Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BA9C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 08:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KDRQi4pCoVVuRyGkn9jX/8tJgyEhGA8Bz0yDnVVeEfs=; b=Q+qnSzi6BWo/VXUpS7rjUZBTQP
	fjmpxqHQM2btawxS+2792ATLIIPafmU/wmxJgZiAXmCXD4woojtqN+bg5kLHlXhgNWEE6+usvoONN
	U1XSIR2d1yV7NL8ESYiN0EA45bYqBiYFKITvDxoMyG8wU+UVHetDFKjqED+H4BHSmpvSsrUoZTbZ+
	aEy4JMHvfXJw3A9rxYEDJRMy6R8Yf9/yoROFuj41RZAkqfAqWbv7IZcdGTZogQg6LnQCyRx8gtZu6
	ZgDpA2hEcLsydTybict/5w8oVzcCPZuIyOuQhNmBJRfxbtzi1iBLqX2kkl+TASUOlPxpN4h6CBi/R
	gAjsF1tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueqw5-00000006n7c-1c50;
	Thu, 24 Jul 2025 08:04:17 +0000
Received: from mail.tasknomic.com ([141.95.16.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueqc5-00000006js5-1erw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 07:43:38 +0000
Received: by mail.tasknomic.com (Postfix, from userid 1002)
	id 0D585A6F19; Thu, 24 Jul 2025 09:42:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tasknomic.com;
	s=mail; t=1753343016;
	bh=KDRQi4pCoVVuRyGkn9jX/8tJgyEhGA8Bz0yDnVVeEfs=;
	h=Date:From:To:Subject:From;
	b=QF/bbtZQJHQMG94RawBjxPZg5W/FNUynLJuUD7hWZml7Yy8eAw0mp07RvMr2AHv1J
	 CD7vhkWV5+OBMtnJNODoutq2UObc8XFgflYGvr1A9vR/LSHSShHKD6kV8kxaE3JWYW
	 AmdSxsycPGb4XAj4BNBLa8NG/InOZ6kjLWYNfA+KhXccOmSidtqwzv0ugESKNTlWhQ
	 /ViY4EkB6j6LfhV9Da3/uaIfepjVFtIaZ/8s0XM3IvkmWKLoPyhRm0zTau5UzToFDd
	 rKnXwURxwNUsu5uOWxWUyjGKmCZOjVHoOODaFFK3/sLGFq4dfW5Fm4tzPYd3Vrj9/Z
	 x3K3iBfamQHKw==
Received: by mail.tasknomic.com for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 07:41:03 GMT
Message-ID: <20250724084501-0.1.k8.19s94.0.6b2cj27d9y@tasknomic.com>
Date: Thu, 24 Jul 2025 07:41:03 GMT
From: "Jon Brennan" <jon.brennan@tasknomic.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Equipment - chairs
X-Mailer: mail.tasknomic.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_004337_583228_4144A70C 
X-CRM114-Status: UNSURE (   2.26  )
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

Hi,

Do you offer a seat for corridors or waiting rooms?

The shortest possible length is about 12 cm, with a wide range of practic=
al dimensions, with a little over a centimeter of space - with a small, l=
arge, large roof.

This is a solid and convenient solution that can be selected by furniture=
 distributors, for use in public matters throughout Europe.

I will send you the specification or photos - can our product be used?


Sincerely,
Jon Brennan

