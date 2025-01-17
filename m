Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FDBC02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 07:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F24Ywam/p+ofkibybtKEAiJQBVKXbmYXTkvfrfJmGwk=; b=Zkz5rNWH44e0/QBi/XYGm79cVu
	IAN2N2IWtG13fnrQnzifgqlO8GTBzDhaEyvEzrF4kPPyDxxYx72+Hlp7M/furAXNs9dxwXg2O4SNa
	wGvXgtt82d21MJlgapNt7nPpR4DbDfm1GdMDMedIjzoetYArlKzmNlq4P2Lb1l4OVSNAkeavyj2Ik
	zs66sv51njuuNritISj9NOoxlvUDzkWfnLyu2d8HdskoPMQd8nRzS4aOTfJ6K7d6Vq51Lh3nlOcDv
	bdlttlIz6S+wL2bfpJuH6sqihYbZHA6klm9AMpJ8H2ColQc8KTCNNqvdyilMdyWl0zY0za/DahQj7
	ksNXmKIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYgmD-0000000HCkN-2FTf;
	Fri, 17 Jan 2025 07:28:21 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYgkv-0000000HCNA-3IZT;
	Fri, 17 Jan 2025 07:27:03 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so3080098a12.2;
        Thu, 16 Jan 2025 23:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737098820; x=1737703620; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F24Ywam/p+ofkibybtKEAiJQBVKXbmYXTkvfrfJmGwk=;
        b=jH6Zp0i1qqhQBSpmDlkLbDSk9kfTfzOYnWM5aKSKDUgp02gmhuiV3z2XJIZw/JNeYk
         JLjkJ5J8ro1QvXuxFpi0V89gXkAS47SjG6gfjhf2lHclMR2Oe4b0t4gE65UlNpI8haVD
         PZ1AfsQxtgPShwBCXeDvhSQY1xKwAytDsQNwRBZTmL9Sn9PEFQ6mE10RvDKKwhLt6aG+
         EzVpoHN0otSsdkWataB7wrOIU+KsDR6Qjo7dn3BFo3MioHSgqfEaZKq8rAha5fv1nNLH
         0qaocKJG9/sl5Qn7BCgvHnrzecklWtklqld7nIn2GmaQW39Lda12UBfS/twP4ZqjcZF+
         o0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737098820; x=1737703620;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F24Ywam/p+ofkibybtKEAiJQBVKXbmYXTkvfrfJmGwk=;
        b=dyW06D7/8VFRbpkJMuA9Gm3AqqvBPUz/gLtK26dgQjeyFpOdf1V8huMpe4e5QYjrLo
         GlwzgxJH3+kvTZQsQhsj5erAhOdEhJEGBjIx8hQr3ef0Kjd4sprQz/2RKnQUJuJkweq9
         tSWkRuyUkv9kQZDX3hKwgV707eCctpHDK1jzT63oIU80vkhTCpdx7gkQ39wgGfr3l77s
         TCcTawpaPywQ0anaQFImQiqQsU8YbA28uAyd4Q2BChwFZMSMwDULw74KdwhkWB0F7IPM
         XTCRXPs3TbCVRbh5rMOYqSNveEWz5vvcPedd935XUfXVS8OfzRbcjVEZhpijoljtnKtE
         2cZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGrlk3bkWCn4RrDeWh0ROXCUUIUCOi7YFTOPkmgV1vjcB0dg+mlEAb2h24Ugr/+hIno4WZZBPHg6M4SK8=@lists.infradead.org, AJvYcCUc/BwTsHalv8soqrgVrgwkx8kCIWqIpvK7OL6gfSwGdmGje/00VVfoh3byYW89s4AIRpWqd6TUlPtX@lists.infradead.org, AJvYcCWsxAQXC2pECeOULlxg0ttjR9V9LZ544mvvNgOGS+8JYF7XAR3rlD220lQeUqGjr8wp4ekZQnYJiY3KgH0pNKBX@lists.infradead.org
X-Gm-Message-State: AOJu0YwWShZhuOmRRXwZ7tTofCt2emI3REwPMdzO98QFtGGoLWB63dz3
	KbglPKxKCUwk2A0knACySo8zESGFVrQzpjzl6s8NpPRVpXiJCsfv
X-Gm-Gg: ASbGncsZq1Ly/rYA/q58uZMWFEpZi5WqlkYYvU3wBFtskaQqhHuUp52HDIVh4OVWe24
	65YHyE70lBBn3pZ3wZEVXzNdfxI44uyRSx2vwIwoMyEuRqTWELVQSTG8WyToVQqwvdvMvOF0Ffg
	dNhA0WCJHB+eyRyXnEOh36CEE/HyTJpY8ZIK/Oha8a4//asllmDww0uFTqHqNDxj0cq8D/IEtrQ
	DlrmD3SLdf4hm1F/aiUBevJtB0pbJdMxlNrNNpsh/u/OMv+5lbpOjK7yU7Z338+aAzqZg8M1vua
	21/4YWVoBsRYKUZWC04=
X-Google-Smtp-Source: AGHT+IEJ47ULSJP3koS5kB9oV3dzXmmnz2xu5B2PxtVsCDw5X7zWmfzS9Fwll8RLJEa/W2eN3Ozjlw==
X-Received: by 2002:a05:6402:26c2:b0:5d2:7199:ae5 with SMTP id 4fb4d7f45d1cf-5db7d2e3014mr1246401a12.5.1737098819744;
        Thu, 16 Jan 2025 23:26:59 -0800 (PST)
Received: from smtpclient.apple (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73edccd4sm1072439a12.77.2025.01.16.23.26.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2025 23:26:59 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH 10/12] dt-bindings: phy: allwinner: add v853 usb phy
From: =?utf-8?B?QW5kcsOhcyBTemVtesWR?= <szemzo.andras@gmail.com>
In-Reply-To: <Z4dpFqffMJ31ml2y@vaman>
Date: Fri, 17 Jan 2025 08:26:46 +0100
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2D99DF28-4CC0-443D-8E5F-A2AC12EE47B7@gmail.com>
References: <20250110123923.270626-1-szemzo.andras@gmail.com>
 <20250110123923.270626-11-szemzo.andras@gmail.com> <Z4dpFqffMJ31ml2y@vaman>
To: Vinod Koul <vkoul@kernel.org>
X-Mailer: Apple Mail (2.3776.700.51)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_232701_822831_0CE3BB7B 
X-CRM114-Status: GOOD (  14.90  )
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



> On 15 Jan 2025, at 08:51, Vinod Koul <vkoul@kernel.org> wrote:
>=20
> On 10-01-25, 13:39, Andras Szemzo wrote:
>> Document Allwinner v853 USB phy.
>>=20
>> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
>> ---
>> .../phy/allwinner,sun8i-v853-usb-phy.yaml     | 89 =
+++++++++++++++++++
>> 1 file changed, 89 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/phy/allwinner,sun8i-v853-usb-phy.yaml
>>=20
>> diff --git =
a/Documentation/devicetree/bindings/phy/allwinner,sun8i-v853-usb-phy.yaml =
b/Documentation/devicetree/bindings/phy/allwinner,sun8i-v853-usb-phy.yaml
>> new file mode 100644
>> index 000000000000..773c3f476db8
>> --- /dev/null
>> +++ =
b/Documentation/devicetree/bindings/phy/allwinner,sun8i-v853-usb-phy.yaml
>> @@ -0,0 +1,89 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: =
http://devicetree.org/schemas/phy/allwinner,sun8i-v853-usb-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Allwinner V853 USB PHY
>> +
>> +maintainers:
>> +  - Chen-Yu Tsai <wens@csie.org>
>> +  - Maxime Ripard <mripard@kernel.org>
>> +
>> +properties:
>> +  "#phy-cells":
>> +    const: 1
>> +
>> +  compatible:
>> +    const:
>> +	- allwinner,sun8i-v853-usb-phy
>=20
> Does this really need a new binding document, if so why... Cant this =
be
> added to one of the existing docs which driver uses?
>=20

Yes, that was my first intention too, but didn=E2=80=99t know how to do =
it propery, but I=E2=80=99ll remove it
and add to one of the existing doc.

> --=20
> ~Vinod


