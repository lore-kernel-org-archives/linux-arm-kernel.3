Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F8AC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 12:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5QvAtIEtTEqZ8qHALXBrrL/YE20SBIoM2otzNwG/r78=; b=vBrB3XswNa9+iUj38whGqlPsJa
	hURcjs7YuKA4L+r/M6WHYf4v+DLmA5ZHa11UQ8YdH37jh9kKjpOeMMhAXzhjyXyLOsQeViQnL08AK
	S6eTpF/mYuILNcfQFm7lw631Xyvhl3Vckd6OLv25JXnszZi7quW1FmK+dQ3RrvuOMeltz6Zeoa/bF
	KVgnGNEgdCAQKrRSsKsLAnbM+ldqa/7B0aDTPL4hLeLHffJnq/2PCtj4KNGabQlelKRl3URO8BLqu
	t5xc46dASxs4qXWJRX7PjZ+tLa6neXRLA9/Nt9rBC8Dhegltg0i3pQw1IVM6/jMVpNEXKr9wlZChd
	0iShMgqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzDyA-00000000J02-2znn;
	Mon, 31 Mar 2025 12:10:22 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzDwS-00000000IpU-02Gu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 12:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743422913; x=1744027713; i=markus.elfring@web.de;
	bh=5QvAtIEtTEqZ8qHALXBrrL/YE20SBIoM2otzNwG/r78=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=vKrAgczGNmQhVHvFPHfKaU+M31A8VyvLcmvWegMp35gae+QwGHuI5QTkr8UD7I/6
	 91b32dwR56FveJ60NS/mOF+GnBXZFTFro14gUPR2bvcWLwsHkNGl2JHEjl0HW18Kj
	 6qj3JrT6qyS3ho/7BQ7pSxjIr6POSaYpk4RZc7DovmHsoV/CtyCf1G7If21htfYCF
	 lFQDO8NuLGd2/rMftleB0jBGtLMd7j8jSMo4H5Shl5QnoZoo6WcdH71P165smu9uJ
	 b7bE4wqU4SdBxf7lfOOJA64LPfcARijjZqzDr7AtSBNL7tcv9VZfheRV3acV9KVUT
	 aG2TL5Jnbj+dLzk6PA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.37]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mt8gF-1t6RMe1U1R-00tGfW; Mon, 31
 Mar 2025 14:08:33 +0200
Message-ID: <d5c788c2-846c-478d-93ba-29e0e81c3e40@web.de>
Date: Mon, 31 Mar 2025 14:08:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>
References: <20250331102346.8772-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH] drivers/perf: Add NULL check in tx2_uncore_pmu_register
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250331102346.8772-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LSkMce5ajgAu3BUJrdo2bQ2KVNlJvVO3jINbh+REZZXCNHCyzKa
 mnBRek6u8v41SnQWSqWHoivt07mZdJU9Y3o+R4mUG7ak30byCkK5WRpcyJrr4YtnqaCCrVr
 OXOriQPmD95zt6hnmraY/WTeXjmGBO0Tpuzx3shmY8VCJ6ghtWiTP64Od9B7UNhg+COBe4y
 G9c2WIBQTUFWTIdVT1jIg==
UI-OutboundReport: notjunk:1;M01:P0:Ls+bdDrZNBc=;cddzIyb8Stps586mZoAvz1PKLJl
 /wxssLt8Wkh0jbyB+I/suAdnzS0KzfIuiddc4FR1fTTkNG+d1EhhQeEpFu1qU4zXEgQ/1YEsQ
 TWcWTKteYL5VABVq9PhzISQNKvRcDk9JP3Eeb35RLBz/he94vT3+7XxODx8FuxXyoe82dAFQC
 2MJRpA/zXrLeVcbbMu8T2KJY4LeHL7yEwZ0O3JjJglXhwkFMYjf+KgqiP4uXfIZ1CG/HjA4x/
 xUJGEwnESby/VzvClYpd39kVSMvgAydR0MaagnwHarTF2lDobYufAy20ATOGOU5SpDWifuSMH
 dwusmTe0RB5XdrmaPFEweBm90LlaSQ6Z2RFcHb+G36pNliBHRByRZulyDeeZuMDFfOlpzRz0c
 wny6uW2aO9nSb05IkB7+F7//U4zQGn2b4BnjbSI9CgiJ6FQ1ALWaoPy5kSI5aBalnN48I0pXo
 02ruL/Sn8g2Hax5Ey/LOEjNUwWGk0ptB62ooxPanhHFt1becj7iB+LuZgPOnnQwOFwRd32jsL
 H0QtBqS4zEd5aL281YpENOZ0vTiiVGi0oQdjt6ojMRyWGJJ7cRuKRZN3S84WBxhicYWIUj5rz
 vO+JL5Rd/RukEY+pm9n2Ls2OSZtLhnVWTU+tKcTzBvSD+ZE+KEqiRyJDkRf0nkIUTYDOI2Kjw
 RsXixGUKQvHfM1gVGywhQ5Y7QL4iromhjnks5sr0Phd4HjD1K9uuoPm1yUD7uhXqwEwlLy8av
 RSxucpxzINMKPw35aZLlCgnUKwnaRhzdSKF3blutekoKYYUAPiq+8H2+y5SG5dypFYVIzRiGH
 8IxAuEHILYEr+wCRCS8xUBVZVcjCE2RCi7RB4PQ7WdO2TA10xaL0K23LWJ+IJvKhg2XHs3XyS
 t1irigUDt4Tiz1sI3Bx9ALOsiYr9zDZmdoJvLBqCaXJzbDyX0H//gRp59MPkg9ncLUPnLjdpB
 eaMQPu0+DxlnI2Xd9hJLKCiFvlxlRzo44eVzYhROu9YSgX9ikeWXw7ZVsIRUyNX/AnD8lzD/5
 sDiIp2poLxCJG963bgOtaETUw2KgyvrNv+nfcxPTx03qxS+1gOXyqKoU/pGAiwqU3WKkYzxl1
 wV3P/mg2jBt2/62EanFSa5Ao5PI04jH4rCSApEoaFBddOO9GmmybgaMlWYEwVPtRl1A6rXljm
 q2rQzqChK+KRFnf9n+4z5TdU7i3Kp30kKsLut3LRshaO/8UDUUhu5nNxSK4ZV9UqVxIbIW/9C
 r1dn17xJHqaxWGPMx624eOr9tNgmPYOcr7vJ0dPRmbZERKFxdI88ZMaVVjZoMhbCP2ey71W2H
 vT4G9PJPRH38zqhN40cc6/6BX4UmqVQnc4QT/VRKbHf1vkTMQY1yazQ14UykMVy4OW0H+RPLf
 NCFW8EMD/z4ajhaa1dkoBdg3H9ZFKhYbi1z9dkV6xUabtL2HXFLZ0Uhk98cUD1L4s54eKeIYl
 N+Vqn6sD4FECBNb6DDNzleyRqSTsLt1yaFOf5kd5b7nDSggm0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_050836_358642_FEC0C0D5 
X-CRM114-Status: UNSURE (   6.13  )
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

> When devm_kasprintf() fails, it returns a NULL pointer. However, this re=
turn value is not properly checked in the function tx2_uncore_pmu_register=
.
>
> A NULL check should be added after the devm_kasprintf() to prevent poten=
tial NULL pointer dereference error.

* Please adhere to word wrapping preferences around 75 characters per text=
 line.

* Would you like to choose the imperative mood for an improved change desc=
ription?
  https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/process/submitting-patches.rst?h=3Dv6.14#n94

Regards,
Markus

