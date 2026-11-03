Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AEA606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d+4qNjdU;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E8EXqdRI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SoUavllOOu5q4EGy2EwAVcdcsFqC0ZHBZHZDDMPy0Zw=; b=d+4qNjdUxrPT8N53LYLV1B8uHT
	qJZQiOrblZf2ps/hm2CW/rj2EfVwf2Ug1nZM7fP0cHYZ2T3WJ5Vl/ApDLkzTL2d8CJ4uJMRsSvXml
	lbs8ChBB7L6B1+LeRLC8gwStMeUrV1xKGaspTBwgArh5XftO6AKVfmWkHZn8EnupBSbPRNGckX77M
	0F3rdFo3zQFe/RaCpHOZP2Wznzvd6+FoUOEjg8tw+ntMm8h3FlByhidgEiSatRoWTKYon3vexsnhZ
	ZfVUyQ5zO41Se+GtI5WNeVMptXVOmjo1RZMBn7OCc3sdNyqO5FGCbF/dXERAdM5DvmdR/c36YqVhV
	06PmlPuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOB0B-00000001mK9-1zIP;
	Tue, 03 Nov 2026 09:40:23 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOB08-00000001mJH-42vk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:40:22 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-67989a98f8bso2660744d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 01:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793698819; cv=none;
        d=google.com; s=arc-20260327;
        b=Bb9R98s1F44xXbryfyYngZAMvs+GLiQDt2VAO9OypK3issc8bIEloa0clxqtqx+SJk
         K5xfSINHdUqI2pfabbu8lT7w/hio3g8+tN8y3UK+8xnkDxYjZ6f0eXPdOO14WDesKbnN
         irrlJT9Ip+KfmLblv/HNBMtZA+uuI5SpY3hiWjOi7ls8qRKSwrNJCWoEDQGVFRFoTWif
         vLJR+HX863ZErUiQkEd31yLn+4FDyLsJ/XJiERUlOYAzsQt9DlEAlYq6oSdi0fIzStCU
         I+p3VqGUK06mIDhV7uCfbLqPprJAo3NZbQDmraG7wjzdz+m6d3TwYr0yUcyrHKNaFW4K
         //Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SoUavllOOu5q4EGy2EwAVcdcsFqC0ZHBZHZDDMPy0Zw=;
        fh=wabY8tvBInZ2WwgA3BPqHM+E0RCRgTnoa1zLXccXcIc=;
        b=owM44udjK5xoS9wYntdKAHQ2CQepQjHd9dcy3a88PjPCfrsxUhJMnCa3a+ONVEj/2r
         Z1cUFRAKMROCYWn9urir+9IfmehphosU1XsJ1Bgmky1jtsUs0Mlhp0HzktSnOX+8fBAU
         8SrCkcUOoPwK9DyNJafof1OVz3JSxeTmtlkpQiIqNAbUV0vlWzD6DnPHvcHvVFN/GgIR
         a4sDNaS23wdG8wuhk2uXwnOQ8Bdk3gqHkL2KPrbUiVAVlMaQvLDMlYrapVIkjLJT5/yd
         nM2YJ+/k3o4/3IO5KCoxXl59sX9kGtfPJmMi8KLGrx7hkEJ8B8xjGaw8I+v/VrSY6Nij
         Xg1Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793698819; x=1794303619; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SoUavllOOu5q4EGy2EwAVcdcsFqC0ZHBZHZDDMPy0Zw=;
        b=E8EXqdRI5/2ol7UjQfzMHJFMoIhl5WEG0pqHx0SgmyWwXmw5b37q3qa2VWaf76ORGC
         ZJJIsKNAAzNCXHdcnWgAzCpzyGWG5nmh8G4OIejtQ9UG5d/Tfnz9NHug7zpi3ZjV+onn
         e0o8aqBlwThX7m49lp2+wNhXTlo3sCEagFStTiGAnt5cVAZl7XS7bELtLeHtBuLa2EhS
         bt/j4NWCu4frLHWJKJ7EFXKJFA5ZBu7jss35twtBNEcMNvg4q8Yo3jtDqo5+wiNzgNMf
         hVFeo9GScXxuYiRgecIN1nLHDx5igZhMKWpXcZ44zonfvNkDR5OLVBlFtPkWOiAn9JpQ
         w1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698819; x=1794303619;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SoUavllOOu5q4EGy2EwAVcdcsFqC0ZHBZHZDDMPy0Zw=;
        b=hnUgbeoGVWf+QcwVz/EdPzYkwA5HBn0LWUa3CtmEfHHVT8O3yt1KcFnt3hvx5kazXx
         96euGREh35PlGXOJLm70+1H10Gkv+io+Zh3tfJZKKgEXB2iceWTC/hR7apPD0iKikr1n
         v2g8Ge833zyQjKs1xVIRxu8/Gy7hY2TMX0KK0lqGuSWu3NbzCCtIdnKXV/pbC2W1N/G3
         Qf0c6SkZCzV1ZPyTNarW2elld+3/oSY5fUMau1Jz3TXTNzbILXagTEOQvmRjeOE5dOGS
         9gK22Op8XWKS2gm3o/o8r0tH3iOlr85PHcRjF3SexoFnGY64ryNuYhPTtTSt648co3W0
         A0yA==
X-Forwarded-Encrypted: i=1; AKwUvByOlb6Fy0v5KsQm332AenHG1Ce2rCpSKGQ0TotZqb4cMz61D+JtF/DqxWN0D37aH+UYF6PDNyH9Sp9Cbe6NaVjH@lists.infradead.org
X-Gm-Message-State: APuU4Z92s97JC5lT+syUVmpQ3PZ/lm8waQ7jThIcZNnTcFPG+TPE0fLs
	Tuf49GDxHR272EL8mqC7y9OaRzxV0pCUgqLtwcwzODk1xs7i3EtpExTLqw/2ItruHmyjV8YVXlc
	ZH4SYrf7upMWamxXpDMnF4aYqMtX2sQ==
X-Gm-Gg: AYBFou3jQH5WhrrXH0nxWClrQx4N2QgYytwMJoYs1jSHyMRwxC0WyUEtYnyi7nkNNrS
	VQ6irQ4RolhqNA5dfVhFWY9bnI4RgvmUcjGe2MAg6R6PdN8RkfuunSnnqzgQ/5J1GA6PFloXnHm
	ljPjXH9Za+YXpZP3+3VLb1f7tweKMu80rRVOSY14f4Mf+6tfXm7f21+BgCfceZGFlYQ+HCLmheR
	GdV4TMWunrtNC+VK0CHwYqANixVD8KSGZjRLt1MLuo8p/Ke1wZzm23zjaNom1dFMbbGDvBaTUqK
	HYjAijLg26wqB2p+ozVMSpUGDV1oqRswTh6mJupQDhTzTidGnicE+vZIQv1Ul+kTY6W/NC7o3v7
	MFl86c2ac/odPyfdT92ZaWY/68w1J02T8BuTFdQ/nRQuGZPzuEcJg1TT0Xga3T4OT9OvOzATC+d
	BKx6fc1hBa3j05F+s=
X-Received: by 2002:a05:690e:80c:20b0:671:3c9c:e5ad with SMTP id
 956f58d0204a3-67ba4f070c8mr5998587d50.49.1793698819403; Tue, 03 Nov 2026
 01:40:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
In-Reply-To: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Tue, 3 Nov 2026 03:40:07 -0600
X-Gm-Features: AclHuK-4a97yVJVbkGNNnQIL8viqTEZhruO_MoVfFcSl06giv7eYpRWt0lOZS3E
Message-ID: <CANxy8yTAJ=9AwD=s_oVpvnoQWiip2NDecscAJmccRRZ8bCfzww@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: rajanyadav0307@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_014021_007728_D49E15BD 
X-CRM114-Status: UNSURE (   7.43  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For transparency, per Documentation/process/generated-content.rst:this
patch and its changelog were prepared with help from an AI coding
assistant (Claude), which drafted them from my instructions and helped
run the tests. I reviewed every line, checked the values against the
Allwinner BSP and the A133 datasheet, tested it on my board, and take
full responsibility for it. Happy to answer any questions.

Rajan

