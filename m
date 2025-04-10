Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD06FC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 02:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6pkHqf4bn8O0thSatfpaOrYevzMw4DixaFZnfOik4EI=; b=cLtvh4X/Kumer9
	6YPBTcKeR6K2mEANeOfyW6Go6go5+5YgROGI+fd83Ry87RtH1J4oNoujInf3fxSzda/tZajZJw4Ou
	YgLSP7oI7Lj5ERZys40WTh1zOKuQnwPeq97knPpq1fl3KOGVvtj5lwRgdVA4LsP1HrP2GfMJgpmFc
	mikXSLZ7QFDYgkUxUv09iHNTGRWLrd85xoc5iRbl/XcORZJ3z/155FpYldX259rWckpXvhNiA5MAx
	+11FKdGCBqiBcBxI0t1LDFb7q8ZP0ML4904VZ3Bjhbe33dXio18F0IovToJxyugR8Q7nz4IBDBZN7
	/TKMslcYvkyqQfZ5ng7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2hzr-000000094Wk-2Zst;
	Thu, 10 Apr 2025 02:50:31 +0000
Received: from qmt20.citechco.net ([203.191.33.192])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2hy3-000000094NR-3sdy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 02:48:41 +0000
DomainKey-Signature: a=rsa-sha1; c=nofws; d=jf-bd.net; h=reply-to:from
	:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; q=dns; s=dkim1; b=fdsjXZxybPYS2jSXaW
	ORdcL0bNCKl58L06sYvMwFgWLb1Uoa5AyGRrwNmgeNOPWqjUZpxgDrWWeg9L7/Wo
	VBgHQ9XasezZM0iT6VUDloVADU1qKNjl0a6KUJ2hiG8wCRj3rbDjrV3fn56kdgNs
	chnDSQJ+ZIUwDdY8Ckxrz187c=
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=jf-bd.net; h=reply-to:from
	:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=dkim1; bh=BQ4VYQ759GlRs1a2EUBRjVDV
	aZ8=; b=vVz6O/JhzozJidU6+sLjqhI4eynNrAROqnKN8AV3OCSg0jDs7f54ES3d
	Y8ETECxCFNL2W9mKIeshlT6UOkx8EH0rlGSGE/NEuSbEUTxtme0zCVSJsA1rkaGZ
	NtQn6nkVq6zNG3QADi23Y11sNKxlBxRVVrWClq30j2linuJZqfY=
Received: (qmail 9089 invoked by uid 89); 10 Apr 2025 02:48:33 -0000
Received: from unknown (HELO 179-190-173-23.cable.cabotelecom.com.br) (commercial@jf-bd.net@154.205.144.222)
  by qmt20.citechco.net with ESMTPA; 10 Apr 2025 02:48:32 -0000
From: Winston Taylor <commercial@jf-bd.net>
To: linux-arm-kernel@lists.infradead.org
Subject: WTS
Date: 9 Apr 2025 21:48:30 -0500
Message-ID: <20250409214829.BBC0D959E805B3C1@jf-bd.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_194840_442339_38139336 
X-CRM114-Status: UNSURE (   2.30  )
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
Reply-To: winstontaylor@theleadingone.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello ,
These are available for sale. If you=E2=80=99re interested in purchasing=20=

these, please email me

brand new and original
Brand New ST8000NM017B  $70 EA
Brand New ST20000NM007D   $100 EACH
Brand New ST4000NM000A   $30 EA
Brand New WD80EFPX   $60 EA
 Brand New WD101PURZ    $70 EA

Brand New CISCO C9300-48UXM-E
Available 5
$21800 EACH

Intel Xeon Gold 5418Y Processors
QTY28 $780 each

Brand New C9200L-48T-4X-E  $1000 EAC


 Brand New N9K-C93108TC-FX-24 Nexus
9300-FX w/ 24p 100M/1/10GT & 6p 40/100G
Available 4
$3000 each

Brand New NVIDIA GeForce RTX 4090 Founders
Edition 24GB - QTY: 56 - $700 each

Brand new Palit NVIDIA GeForce RTX 5080
GamingPro OC card with full manufacturer
QTY 48 $750 EAC

BRAND NEW - ASUS TUF Gaming GeForce RTX =E2=84=A2 5080 16GB
GDDR7 OC Edition Gaming Graphics Card SEALED
QTY50  $700 EACH

Condition: Grade A
Used HP EliteBook 840 G7 i7-10610U 16GB RAM 512GB
SSD Windows 11 Pro TOUCH Screen
QTY 30 USD 100 each

Condition: Grade A
Used HP EliteBook 850 G8 15.6" FHD,
INTEL I7, 256GB SSD, 8GB RAM Win11
 QTY50 $240 EACH

SK Hynix 48GB DDR5 4800 1Rx4 PC5-4800B-
PF0-1010-XT 288pin Server EC4 RDIMM RAM
QTY 239 $50 EACH


-----------------------------------------------------------------
---------------

Best Regards,
Winston Taylor
300 Laird St, Wilkes-Barre, PA 18702, USA
Mobile: +1 (570) 890-5512
Email: winstontaylor@theleadingone.net
www.theleadingone.net

