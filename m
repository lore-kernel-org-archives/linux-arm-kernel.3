Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44E3C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 08:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vdHO8YvBK17Mb+rjnMMMnqrXx61uFtvCNBz8M84xHHs=; b=FqJumZ4CKwKaSA5Yl4pDh6lINk
	G7sJh1t9MUAmAdSGGmbcwQoF3TNvHSk41m7wz0hTwFPkFnP5gqjrRToQ9McqhkZZOWQq1pfcc29C5
	ft7v/1OVUoy1RWempZh10SDWskXX+wFH0bA2bYqnEs4+6WPuDHoA0LjCisRLNGkwKjOeVDXyNZ/a2
	PTQnicKeB6p6AWcizql3Vlx9bVahLo2zDPN2fDm/goSwFGEwjKfKVO8iThb8pWrW76BE0k1zCc6aF
	zanD49DgLtDntNXbGOXBo0l6GUvwSYsZmPi77cOcwb3QlJYy7++RK2bQSKlRkzih0n7+IELRcRhaX
	P1f8Ekeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0c9w-0000000B6o3-24dL;
	Fri, 04 Apr 2025 08:12:16 +0000
Received: from mail.commetrax.com ([141.95.18.165])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0c89-0000000B6iQ-2GhI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 08:10:26 +0000
Received: by mail.commetrax.com (Postfix, from userid 1002)
	id EBDEE24E44; Fri,  4 Apr 2025 10:10:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetrax.com;
	s=mail; t=1743754221;
	bh=vdHO8YvBK17Mb+rjnMMMnqrXx61uFtvCNBz8M84xHHs=;
	h=Date:From:To:Subject:From;
	b=YlEFGUVqHBZOqGgtoE+etrz/Tz5Qrs1xUOlYGiG616Bk2N1wOxeV33IM9NS4Xp2R5
	 x6+CXIW4XTVDA4n/OZ9BWog9Tz8w0eJvxWMif5Zbay3qSANCx1nSUlyfhG2ZZkZhHK
	 1nT1ePyVY7yVJuXcOx0Gr1Q/aWRdqJEeapeqUrQOcPVZCBmxYoEYT9cy7jYYX30kPV
	 0Kv3V+dREWgO+0mOgIlcUehOW73/yNfeaWK0rLI65WdZnewdusuDW5unmOraSh/en1
	 5iVVpKFGWzj/VFg545kCpRbVnKy8zZ55QVId9Qg9dpdyTC5xPWsCmaGbRwmGDYcwGb
	 XEuy/q2LfRaqw==
Received: by mail.commetrax.com for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Apr 2025 08:10:11 GMT
Message-ID: <20250404092858-0.1.8u.txfi.0.b4eb3o7f8b@commetrax.com>
Date: Fri,  4 Apr 2025 08:10:11 GMT
From: "Vincenc Turek" <vincenc.turek@commetrax.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Plastic components and packaging
X-Mailer: mail.commetrax.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_011025_726713_5C33BFDB 
X-CRM114-Status: UNSURE (   2.87  )
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

While browsing your offer, I get the impression that packaging quality ma=
tters to you =E2=80=93 it=E2=80=99s not just about protecting the product=
 but also about building your brand image.

We manufacture HDPE and PP bottles, caps, and buckets that work perfectly=
 in the cosmetics, chemical, and food industries. They are durable, aesth=
etically pleasing, and customizable in terms of color and closures to per=
fectly match your brand.

Let me know if you=E2=80=99d like to explore solutions for your business =
=E2=80=93 I=E2=80=99d be happy to present the right products.


Best regards
Vincenc Turek

