Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D047606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 20:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K/UdXjjH;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=kodvNlda;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=GUlSSExc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=s6WjUralslYFASxPP4HFK/GklRfDYqGQbw7ylOM1BHE=; b=K/UdXjjHyFNRawKTd+6FuiHskF
	pS9x+c6dA43cFBQfsjk0V/pskpf8PGVktYkMkjvtC2guAyFHgwz62jduQBv7jfTQtR+8704t1MvSs
	i5k919USb9vFgdOg3ZLrmpK7MXAIcRnV5FKs7rqBbVp1Fb83Y1j0DKFHkYs+BgLU2A+HGCFTYMc08
	1z4rSAgk0B8FS94THuMJEMBjDbjMVRsm79suAylAPqysARtnByPkF8wODp1oWMyv7c2pdluH1BIpv
	5iGbaj0Sg6xxtKWsVHyKfeUsd8KVQDx95le++sbuO17wcNL78HJWTot+MSxo0u4ThMDNwywJA9epS
	Ku1uNdpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFx0-0000000DgAH-2b5n;
	Sat, 31 Oct 2026 20:45:18 +0000
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFwx-0000000Dg9m-3piv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 20:45:17 +0000
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VHWeu04175651
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 16:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=s6WjUralslYFASxPP4HFK/GklR
	fDYqGQbw7ylOM1BHE=; b=kodvNldaRWjJmiZRmIgdBoXj1U5bHJV2n6MuHvUvaq
	ZwWpk+CH5SIJK4KiyH/EVCViHxnqI5kbD/AuXhYhMiViETF4GBAjUAlzhD+3tqjF
	6DE2OVbuJcotV2mJaDfHH0/VRnXB7OR7UuFVqTeikrmsfqt3KJ0Uffyq83BKVW9N
	bS5pFEMeEVs8BWJnHqb5Ki3IkL5sMsF2gUyXfNKtx/Zsgx8z1ipfZdmSBfX7LYnK
	98VJrTBWo12JNu9BAkQqXpDlSDFItPXR03EEYDs+3k4H82qiRwaeJ/sArPAyRoXf
	6v3IFkGEinOMDE+kPrEKllPPI+f55MEeZAUDREGWmAqQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hn2xhw92p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 16:45:14 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9440b27c1feso321730785a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 13:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793479513; x=1794084313; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s6WjUralslYFASxPP4HFK/GklRfDYqGQbw7ylOM1BHE=;
        b=GUlSSExcv0IVuwV4cHs/Y+mMtDL4MqQx5MCwxrXq//8miM1FmdgssVev5QeUAU5T7M
         2Ss0AXY+tzA3x6yjJ0VxMcZcqNeifqm5EHigHfh915c8To8otVWiAFF/+OhKG9pmKYpV
         XtPKnTh4OzIAUuoelMxwiyOlfttEew4/9GBbC1lbfp5rxJz326lL1aUBjH+lvo3yvQny
         VX8Lle29RYxgx0Sin5Gu6GS5otmynIkhdgay+gdYHwgJdortW9HDNlS+ZqnLQ2X8Df1V
         iKJD9xO3Sbdz/T7cb/0D+qn0xMIULDzbuj1RJFXTiNitCxzFs6Kn5qBLgm+lBaweLHwP
         usnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793479513; x=1794084313;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s6WjUralslYFASxPP4HFK/GklRfDYqGQbw7ylOM1BHE=;
        b=U7B7sGL7MQpZ7cbwPl8sswbTRlf8Nd4FpYZYYOPa2jhlcrb52xAbNhKfGhAA2QSJu9
         DYd0jgfC6c3UMCvGXXIZxw1GKCM5PZamcOpXttxO3UrF1vVGiEVb1ddHDmjGaq+G8e3G
         OjkaBDSc7gW4cJM776obOzMmDzF8ZEQudPLC6ynt9lv1NmBOlhW90FdHzf0c3R5Ex+8b
         Gdj3NpBGvE72f/S/4BjK5KTYFFCksp9g8Dc0Kc/tu9ae9dj9MqRStMQpcrFupjVd3VOu
         LOSSJ4SiNOQh886yG+Jn7hiB1vB9mFFcVUptMcDV9jKZsvhws9uWDHYfidJrU/Eqn3oP
         +XMw==
X-Gm-Message-State: AFq9FYJYPUABycSqI4DcYVpTrkD1EPjZ0PhDjXjOzqPECf80OaiWkCK9
	/2MS9nLuoPa37BFGSg3hdvP/Nyfr9ljB+9QsgmQPGWAvYYqvXohY7RgWrsw4hnJvjSnhI8jNnvC
	2OEZBeQyLNIhmeURiv1NQtHgQbIq/H7EDzV7MYC71K26CB+oKmezgDilVlYzaiYywWzPA2GCA
X-Gm-Gg: AYBFou1pYlwHLuMG3LvbRZCWREJZeRiX+CcXQkhjW0NOgYnAASBpfKb6IrkeZvzVHFW
	DiEGACPZhnr8ViCJcURomjWFuikE98CoX+tcjT7ki8tB8mRrroCksnoVVyXfHeRZt05cGYldV8G
	81rgIzxw88LRqVhl348+3dL3hXHqvcahks5uRS5MBB/Q7YEISjHH1ZVTgNjtXOufTodnCI6hx47
	bTpGLLDAb98UNKXJFXbl8SXqHFHXOYQQEaRu1unwaLYIWAIjq0LyDWW8AiohFL9zyOiOSbnE0fd
	vmlCaRU68lbDtSyzSbJ12MCG7LTUbtD9bt54bGU288rJMLFr2ephlWEqoeKKjfltdjBzhuWf+9o
	uoNgq7Mnx78UpNd67FRFzZUFT593D+kp5ReccwSH0LdZwkeLOdhpLANuyAfc=
X-Received: by 2002:a05:620a:4541:b0:93f:4d4e:ff66 with SMTP id af79cd13be357-9442158604emr1036787885a.5.1793479513554;
        Sat, 31 Oct 2026 13:45:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4541:b0:93f:4d4e:ff66 with SMTP id af79cd13be357-9442158604emr1036785485a.5.1793479513141;
        Sat, 31 Oct 2026 13:45:13 -0700 (PDT)
Received: from [127.0.1.1] ([37.142.155.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09ad35fdsm104242845e9.2.2026.10.31.13.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:45:11 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] arm64: mte: use folios in __access_remote_tags()
Date: Sat, 31 Oct 2026 16:44:52 -0400
Message-Id: <20261031-arm64-mte-folio-v1-0-a8bc2960d11e@columbia.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAERT5moC/yXMQQ7CIBBA0auQWXcSQGXhVZouCgw6RqCB1pgQ7
 i7q8i3+b1CpMFW4igaFXlw5pwE1CXD3Nd0I2Q+DltooqS64lmjOGHfCkJ+c0dlglTwZ8kHDqLZ
 Cgd+/47z8XQ/7ILd/N9D7B1G+WExzAAAA
X-Change-ID: 20261015-arm64-mte-folio-cbfb1036edf2
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793479509; l=645;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=RLGi90LTFARdzpk3/QZ8KFQh6UT4kY3Od3ZT6Kca1fk=;
 b=EMvd58tQlYgVBDEed3L2QldoBU6HY38MR8/N++se6go0uq2bwPqvQs1I4tnvQUzb9rm8s5bdx
 KxZetddIFhZC1I4agK4m+mjbI8cV0YHwvhqFk1jc1rYdXitRcnXlQBM
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: 2-4poQkl7UFiSGxj0gu3ooyKkZ1lo93r
X-Proofpoint-ORIG-GUID: 2-4poQkl7UFiSGxj0gu3ooyKkZ1lo93r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MiBTYWx0ZWRfX1sM/EbgHaoWb
 I3O45C2OUeD07SSBII9HWMkscndUpTGJXsgMbaLUgQ9Ur4S6/pWBi/+1/hNY1ztuISIJMDDbbfm
 sxeFSC9vz5CO0cB/AGs5WPrmguE090Q8ZjfVUg8PtOWPjmg2HfndiFXPW4+H/UU7nGesnJDiexo
 OrXGkhH+xe6hNCTEau9tk/Qc5a2e0LT0XmBxXxifhmOtzuICcq+n/gP+aQUVVwXa059jQrIg0jL
 NCvSNVN9fX/m5UQyl1CZmYSSd+YYLF6mfq9xUyh998LOLiO0dVT86lo/ob/PgQ+icgFhNGVJ+0+
 BbXItBGKs9JoCxVuGTEW67YF2fSi5CAT/N+CPkUGUs7MpC+O4aUd0ugBjglstI6WUw6kSjtys86
 G66QLNWY/od97KRdV4LtTUhW+Yjmlf9/qjqhhELlIo7G9a/0eseUOqf7UdA/fsgRhZe7llIziAQ
 MfSrlb7Ub4E4EH8cs0A==
X-Authority-Analysis: v=2.4 cv=LPLz05W9 c=1 sm=1 tr=0 ts=6ae6535a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=OyQKmhT2Qqi7aVZxTY5mBQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=AAJKwVImVXP-j0t6VHUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MiBTYWx0ZWRfX6JEjvtdGDn0+
 lahkRKNXEMkp2lbZj35JkkWAgYyyI2Ky/+1M4b9UdJtoQ2gBpwO07pBmkbq/L+WoeGXtA83ym5J
 EUv0zGXb4kb++rCkaz57udglm+acdx1ES2Y4yTrpXhIDfWGhzcNq
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=10 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=10 malwarescore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_134515_983843_A4EA03F3 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The first patch converts __access_remote_tags() to use folios. This
removes the last use of set_page_dirty_lock() in arm64. The second
drops an is_huge_zero_folio() check from a branch the huge zero folio
never takes.

---
Tal Zussman (2):
      arm64: mte: use a folio in __access_remote_tags()
      arm64: mte: drop the huge zero folio check in __access_remote_tags()

 arch/arm64/kernel/mte.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
---
base-commit: f46be4da2cbb17574b5369517a9a1e1b414063b4
change-id: 20261015-arm64-mte-folio-cbfb1036edf2

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>


