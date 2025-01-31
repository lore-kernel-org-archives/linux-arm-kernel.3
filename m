Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F8AC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 08:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=; b=YcpqI7PXt0kjd89hO1qpGOEhh2
	5koYPuQ3z+hNusy0w1PRqfLmOQTmxBQarofoJ9YkPB3/dkxMmApNdpzenRJGWy7fB/HH9SxcTfPXJ
	swq9l4rhWDh2zaekDhz5uSHYXAaP6lcsEl4Wz4vtWS76vmdqBSJJMbFGt+V4iEyUYNZOnzZZcCRr6
	VtlkyW0vyZuGjWMX08YfMIKlOgQjaovrw2hGtmvbsWCjGl8EgvxWt2mbCJERJg/QD1U/YQPX0OPC6
	Mt6EV/PN/QWvt5H2FiRzOVn5YmXq4gEQoFSyuYdSTC9Jf8Liu9guaC5iAJyQHL0J0C1AGWjlE6uNA
	uqH+cHgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdmYK-0000000AE27-0Ea1;
	Fri, 31 Jan 2025 08:39:04 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdmW4-0000000ADq0-2ybS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 08:36:46 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id 439C6A3D3F; Fri, 31 Jan 2025 09:36:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1738312594; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=yxgsGgF6Y4RqJ1OBLdvCrDmcJ9dXc3KpmeIZulZR2JpZfcxNpuTTlZtxWJK+UrrL9
	 nbTO98eiB9+6/OdOzb+G8zb0iTz9kte/FDo5aw8Zv2eV9yFX9fro1ew6Z9272sPZjh
	 VJPFROaZSlaeIuXxUuAalLHfXQ6PKwihyD8caMTv1JVsYjOSEK/RDnj9Xuv6jlfsOd
	 YAs5B+j7ysdtsp7J5OL3THn/OOSDLLrGPWVTBkNQDPDfIYeGGpvLYo9ApTt0fPs+HU
	 +/SRerFggry+4Fj6EL+ePLYVYfrI0BPXifoJK5ouV3DBONRJzV4PHZHPHcqkf5a42M
	 ZZo9NXaH5PSAw==
Received: by mail.novaplan.pl for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 08:36:06 GMT
Message-ID: <20250131084500-0.1.jl.15bh6.0.a16l5unh01@novaplan.pl>
Date: Fri, 31 Jan 2025 08:36:06 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_003645_434815_762DCB88 
X-CRM114-Status: UNSURE (   2.43  )
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

Dzie=C5=84 dobry,

Czy jest mo=C5=BCliwo=C5=9B=C4=87 nawi=C4=85zania wsp=C3=B3=C5=82pracy z =
Pa=C5=84stwem?

Z ch=C4=99ci=C4=85 porozmawiam z osob=C4=85 zajmuj=C4=85c=C4=85 si=C4=99 =
dzia=C5=82aniami zwi=C4=85zanymi ze sprzeda=C5=BC=C4=85.

Pomagamy skutecznie pozyskiwa=C4=87 nowych klient=C3=B3w.

Zapraszam do kontaktu.


Z pozdrowieniami
Adrian Liszka

