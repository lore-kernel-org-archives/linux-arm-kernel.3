Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349F7C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 11:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ge5VPrg8KO37tThyzwpHlK6nev7hbYkYNGJz3eDOPNk=; b=DzI4wX/VLSl9tl
	wNxQWvLSTzY2BBPH4WNzl6Io/EMMYicmUM5xDZE6F4nR5Y6rsLq5Nti++PrsADVsKz++u2rxe//oB
	0+G2H+K4ht0O7J360AhwKAudPWSCHldOQWVUcQOTarqQ8P3iEoAvBIXQofVIiidi1d9eVpJhKDLbp
	9JDup+BUHG7tXjPBA++1sN/JYFG0Z2ZKYDD548I7X0bL5tHe2mLSwtETohhe4zvedOtOJa1+g17xz
	nt4DRtBV6kdVDVfBq4AoH0AVx5CUE5l5vEm5QM4g6C+jp5MGbL2LZNhTJ8Wx1kgMntZIm6VAZIRQy
	SUoEkWY3E+VF1JZ2mWEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HaC-00000001eGP-2vHZ;
	Mon, 14 Apr 2025 11:02:32 +0000
Received: from correo.desarrollominero.gob.ve ([190.205.109.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HHt-00000001aya-2UXh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 10:43:38 +0000
Received: from localhost (localhost [127.0.0.1])
	by correo.desarrollominero.gob.ve (Postfix) with ESMTP id 28F64C2A7FD
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 05:07:38 -0400 (VET)
Received: from correo.desarrollominero.gob.ve ([127.0.0.1])
	by localhost (correo.desarrollominero.gob.ve [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id uX4KS2RAydEw for <linux-arm-kernel@lists.infradead.org>;
	Mon, 14 Apr 2025 05:07:37 -0400 (VET)
Received: from correo.desarrollominero.gob.ve (localhost [127.0.0.1])
	by correo.desarrollominero.gob.ve (Postfix) with ESMTPS id E6F51C2A806
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 05:07:37 -0400 (VET)
Received: from [185.42.124.23] (unknown [185.42.124.23])
	by correo.desarrollominero.gob.ve (Postfix) with ESMTPSA id 48A65C2A7FD
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 05:07:37 -0400 (VET)
From: SGG ENERGY<sggenergytechnology@elzoghby-eg.com>
To: linux-arm-kernel@lists.infradead.org
Subject: ATTENTION
Date: 14 Apr 2025 12:07:34 +0300
Message-ID: <20250414120733.852F96AC5DDBC1D8@elzoghby-eg.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_034337_753501_C056BE09 
X-CRM114-Status: UNSURE (   0.90  )
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
Reply-To: kazpetro@sggenergytech.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Dear linux-arm-kernel
To whom it may Concern.

We PRIVATE COMPANY SGG ENERGY TECHNOLOGY LTD, With BIN Code:=20
211140900115 and Office address located at Astana, Esil District,=20
Syganak Street, Building 54a, N.P. 142A. With authorized legalized=20
mandate certificate from trusted and reliable supplier refinery of=20
petroleum commodities. Attached kindly find our official offer for=20
your review and if any of our give procedure is acceptable to any=20
ready buyer=E2=80=99s management, do kindly proceed to issue an official IC=
PO=20
to commence transaction.
And further your management is in need of assistance and further=20
clarification do not hesitate to contact our management.

Thank You.
---
PRIVATE COMPANY SGG ENERGY TECHNOLOGY LTD.
Address: Astana, Esil District, Syganak Street, Building 54a, N.P.=20
142A
BIN: 211140900115
Email:kazpetro@sggenergytech.com=20=20
Tel/WhatsApp: +7 775 540 3537
Director: Dou Shengjun

