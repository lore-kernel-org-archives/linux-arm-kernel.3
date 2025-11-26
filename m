Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716ECD1038C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 08:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=; b=ktDDUyb1jfMdY76UJ3Y7vWZNUy
	3vMe/GcsnjTnwr0N5DRTGCny8BU8Geh2hZKxwLxKvBYFJc0GkIptNsi4CRMT2J3mNboM+pSEUtmgw
	jfDrvz98w67k0kri5ToCKEokMz+PnHnEbjyB5Zop8Pv4Rv1HF981BJKeACG8rB7X9oy07JftCgr3G
	exS34ubRqt8BoAXTV/fADX2m2bQLAhIbGZI2FKH+9VXPMuuPxc5hR0o1dBYd72ifunWf+rhr2ixSi
	XuqCaa9JAg+TxMUa3nZo3Ag3PryIo+WyzbDaMlYM6mfuGspUVasfhURjn2WQdMpbnvrRFHladEqWH
	sm+c49OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBL2-0000000EehR-23YE;
	Wed, 26 Nov 2025 08:57:24 +0000
Received: from mail.vexro.pl ([141.94.250.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBKx-0000000Eege-03L0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 08:57:23 +0000
Received: by mail.vexro.pl (Postfix, from userid 1002)
	id 7C8E3A82FF; Wed, 26 Nov 2025 09:56:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexro.pl; s=mail;
	t=1764147435; bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=;
	h=Date:From:To:Subject:From;
	b=Ba0M9Z/EJilxPevX8BkG5Hdg7M0jbn79Y5vIqYYFHkfh4GsDSHBL8Rc/PUnOUxmKU
	 m04ETZuZrjtXtDgA1oGMaa/ueaa+XTACxK4rs7SmuN3W5sR+2vTrDrzA1xhtG+1+Pl
	 skWNEb5miQAHs8xm/uJWpIYh3/5ngLiXYmYvG4ubUh+iOSfTfTbGslXLp6M8VItrgq
	 7awDCNr+PDw/4zDCQd2u+48YXhunHTVVwiICThd/VRxh+aAt85dpO1mm9CYpjFYHq2
	 Lj3k5UhwvAXlfVJ3EvRb7SU2wEZc2YsbYfeGwJsZiMf6vQvy3c4Cje6ku4sYaJpDWr
	 YvMP8IiyRIaow==
Received: by mail.vexro.pl for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 08:56:00 GMT
Message-ID: <20251126084500-0.1.ot.4m7no.0.k6e57z9p2l@vexro.pl>
Date: Wed, 26 Nov 2025 08:56:00 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@vexro.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.vexro.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_005719_306110_A8FBDF34 
X-CRM114-Status: UNSURE (   3.14  )
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

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam
Adam Drzewiecki

