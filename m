Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F333BCA100E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BD6Zne3XZGwUDgfH6AtniwohdQGaDqOKcXDVAIWcE40=; b=SozILrv0N/DFccDRSYfu0ATpTf
	Vrd/ZYY95sXq/mazRxY0wlkG2+xLoCScKd2EfDlVNNUfa8Zk5vMvmEIdQwIcq1S9v36YDLvXd9xqm
	Plor7CUW/bGxicHs6crf7WhINDL/AEAou0l1xbO+kw887qNp30zl67i+jtR+2MU3w4ewHBcuaNVcJ
	0RTUqhdqSMGjPPng/k8aPOoN8lyVdXAjse6T6TOZ3I5/rS6AajDyWTfCtqywv7Ygt+gGTg4zdPx3e
	NaoACtR43BQxv/Wug1orEu2V0oRUbaQDGUSLKN42WAegzLSGceyLgxRYGxo+6LyKWs75BHr3Kjd4p
	hO5QPbYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbe9-00000002sk9-1WOw;
	Wed, 03 Sep 2025 00:46:45 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utZ6m-00000002IdU-1QAI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 22:04:11 +0000
DKIM-Signature: a=rsa-sha256; bh=BD6Zne3XZGwUDgfH6AtniwohdQGaDqOKcXDVAIWcE40=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1756850541; v=1; x=1757282541;
 b=n4M9BdW1+TWwHpSDIo9huyAfD1siBMhJZAp6y1vXcZc4drhit1TKZxQlSF3J5rJOWMehtiLm
 FjI0RZiaCIHPoZ5fYL0v1DIYETeCEpbYUI+ixE/HitY9n4t7u6dGD1D/NNJEjsZyu0WlXAbtQt5
 qoMz+hrgTTlk8e9a+1L5XcVRqQpXStxYiEW+PXBTRjO3xysEI54R0e/AIU95ftk25RihrwAyPeB
 FMx4eFuT64EDqOFZjJJNI3o7Yz5USA08fOytprjr/PQ1VXQZFHcJsqvWqZHCzPRMrwwdxa9XBbR
 HkIMDqYPXQsZiC0Wu+NhtrTwvTX/fllr4rC6hKLNFOzZA==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id bd5db0db; Wed, 03 Sep 2025 00:02:21 +0200
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
To: Karel Balej <balejk@matfyz.cz>
Cc: linux-mmc@vger.kernel.org, ulf.hansson@linaro.org,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Karel Balej <balejk@matfyz.cz>
Subject: Re: [PATCH v2 0/3] samsung,coreprimevelte enhancements
Date: Wed, 03 Sep 2025 00:02:19 +0200
Message-ID: <4689450.LvFx2qVVIh@radijator>
In-Reply-To: <20250828095028.24503-1-balejk@matfyz.cz>
References: <20250828095028.24503-1-balejk@matfyz.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_150409_916911_341318C3 
X-CRM114-Status: UNSURE (   8.14  )
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

On Thursday, 28 August 2025 11:49:01 Central European Summer Time Karel Bal=
ej=20
wrote:
> Hello,
>=20
> here are a few patches adding some of the stuff that have accumulated
> since the support for the samsung,coreprimevelte smartphone was first
> introduced and before it made it into the mainline tree.

LGTM, with the exception of 2 tiny formatting mistakes with the pin arrays =
in=20
sdh1-pins-0 and sdh1-fast-pins-1. I'll merge the series and fix these next=
=20
week if there are no other comments.

Reviewed-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>

Regards,
=2D-
Duje



