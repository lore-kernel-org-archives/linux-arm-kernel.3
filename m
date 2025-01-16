Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7897C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xnrE9m4m0NwAX3ZPQtWElBALgC7ldSMjLmvALObgJPI=; b=W/1m+mJr5hZSJIMSpdt4CdqsSH
	BVlrCdMi2Q2TiaFCk2MZSfAmMqQwdQmrKYjkpSFseu/Qjd7EkJRZpjJF07o/VhHJZNyrecZ/7kzme
	60g3hJL8QBI7MAUcKymDcLeUe3fIuHrCRDy0Lnt8DpcaqTBJjZ2Au0Eqd7A+LIIWNMqQH2VC3kw4o
	vRTv2rgwln87jOeEP5RM5retOAgBhHZSHcnzj0W1pFoqO8VQFx/QDFtSHKEuOZmsZtsL7PW8zQ8dJ
	ZUC9/ySCkybHsrhALjQDI3/3fR1+LcSttt6HVFiXar2zZUsn+yQ6XU9dGsK08mTnfitJ694TqpyDj
	EoVSNk6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLNa-0000000EF32-2V1G;
	Thu, 16 Jan 2025 08:37:30 +0000
Received: from mail.commetrax.com ([141.95.18.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLMK-0000000EEtf-0AZa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 08:36:14 +0000
Received: by mail.commetrax.com (Postfix, from userid 1002)
	id 7AA8223D29; Thu, 16 Jan 2025 09:36:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetrax.com;
	s=mail; t=1737016566;
	bh=xnrE9m4m0NwAX3ZPQtWElBALgC7ldSMjLmvALObgJPI=;
	h=Date:From:To:Subject:From;
	b=E9dB7EFBtwru3c5uE0F5/HBxaCIinijmhBzPvD9TKF3585A361poXpQPsXtSFwpcY
	 URoUF0OuCOWhMRe766UtwOtJGZ/DbEl7/fFgl9A4YBFBbxT/NFzhjWmjzImRY26Vlq
	 791pVDKdhAKhQq6KvGw8dSpzWN+P0YsMKRLyJJ6t1tZdUUWIuXpIBSt3p27h1HCULz
	 E14yczG7NhKKx672s+c2SHrJ3jpp1YMQLr6exaMejGdB3LjCWmb2wwlzN6SA0Q9OJD
	 K/S4YW3JGDgC7Nvyg7pz/4p67b+2r2koUt+dQ2k72BvxK5HoyH8pd3jPUX8x8EuFdb
	 MDwS13ACFYGsA==
Received: by mail.commetrax.com for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 08:36:02 GMT
Message-ID: <20250116084500-0.1.7a.gz2s.0.e4a28jk42e@commetrax.com>
Date: Thu, 16 Jan 2025 08:36:02 GMT
From: "Vincenc Turek" <vincenc.turek@commetrax.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Packaging
X-Mailer: mail.commetrax.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_003612_769959_48F6CACF 
X-CRM114-Status: UNSURE (   2.93  )
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

Hello,

I=E2=80=99m reaching out because we can offer a wide range of packaging s=
olutions for various applications.

Since 1995, we have been manufacturing plastic packaging for food and hou=
sehold-construction chemicals, also tailored to individual needs.

We design packaging to ensure product safety and to align with your compa=
ny=E2=80=99s vision and visual identity, making products more appealing t=
o customers.

Every stage of our production meets the highest industry standards, as co=
nfirmed by our PN-EN ISO 9001:2015 and HACCP certifications.

Would you like to see what we can offer?


Best regards
Vincenc Turek

