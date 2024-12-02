Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211E0D78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ppr8WxtTmFP5slbOkApIi79MQ0VaItBRbgLDFxiwd6o=; b=OrGD+mXbaW80YFXj8NdckS+AIb
	6BIh/qp5y38EYzFuG4Un/yLsHu+5GgXZxZOzqdQcSjRxdpSLgrgFKglKUT6iDo48EAH0XKz6jRRA0
	GcUalyeWHp5SuuHVglHjo1xpFEmnMTETuLZE+NeGrgs/xzfK//AUuXzbqLhgg3+r3jCKlXSSNLS32
	xjvpztIrB1I+FoGq6ckyp7Tmwa16L6KqhYRTGE62nAmimg8obyDiAComY6kCj3sXYLqqSiGKPdBEh
	FQSme2K3m0ma8qWR8TFR61K/x0klWYq1JBCzrgmwbtOc258ep3a06i6LglWF0lzennvcDeCUSjWQN
	/skeaBLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI94Z-00000006nuZ-1Gep;
	Mon, 02 Dec 2024 16:14:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8lV-00000006k7y-2Z1F
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 15:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ppr8WxtTmFP5slbOkApIi79MQ0VaItBRbgLDFxiwd6o=; b=Ked7O/Ua0MnELNiOXJwKWbKKvQ
	9gCTNI5rvk1lnO7vciDVn4S7oiprxugzSEUqjJZP3V7OZ7/SbGyu0wBYxM4nTXe9y4j6i1AfKEWva
	IgetpI92XChuQ1MZe8il1cPAustIkX4A1y4rKcLkH1/CGYarbJyimFHznNhG1X3knnEyghCENuDGp
	ZDuxr9vY+EiY+hdHVMvWANA3YLc3+h6Gr+TjadNJakXgr4goIvBj0i/d0V8hDVf6SNamWP5+uyNJB
	g1doTvMpzMwnbX1GOed+cSlQzRX6VHyRkXMH1i9H08ivJxKzPwK8j8eomXkazwTgiEHK9hJ1PbDoC
	pFkbOFuw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8lS-00000002C1B-1zTf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:55:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5CBF0A40F2E;
	Mon,  2 Dec 2024 15:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FD4C4CED2;
	Mon,  2 Dec 2024 15:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733154905;
	bh=9wQ89Q5JLop4nCESxKGCFrCO8u8oY0ND2CvEKSdoUys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bc3EEuOquLGwSd6rRDhjH2vCeSO6pMpgam8LdBNxrULqvDJQRiyuE9lhS3qd1DHlX
	 pcImSgXxzzwphdruQbaoPM+a5JydW/GGDoiluxWFYQ6XqnL2smvEXNnfDR1lU54b0h
	 3kyDgCufWdAiXcmg5b/rKSBjv+HQwCsBHZq2uy7GXM8aWh/aU4+vUuEOtwvRhBPc/h
	 sWr2DANueGC6z/HR9OrlTyWL9NZI4HHIQKg+sT4K1INswX6WJ9nrO/E7NSBAbN4YR4
	 hQgq6JHA19OLt05PIP4vlBI+i4ilAYYePi1odbu1FUh2wkRMsT83PkRNwq5eXQ6ZZ+
	 SQ0PrDCmMqRCw==
Message-ID: <1bfdf1f1-7542-4149-a85d-2ac4b659b26b@kernel.org>
Date: Mon, 2 Dec 2024 16:54:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE
 output for PCIe1
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Romain Naour <romain.naour@smile.fr>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, kristo@kernel.org,
 vigneshr@ti.com, nm@ti.com, Romain Naour <romain.naour@skf.com>
References: <20241202101140.48778-1-romain.naour@smile.fr>
 <dabbad2b-f8a6-4ed7-86da-ec696cf67461@kernel.org>
 <k7udgqugqseweckb7hjniz3aops4kn35ttju2ju7f2pcbmndrg@dau5nr4leish>
 <abeb632b-9efc-48e5-a28a-a9d7c02e0a6e@kernel.org>
 <cndc3fopwhwkotfikul2jtzfczpdpwlrs5uhuqq76ck36ndtfs@gvxavxt5tgd5>
 <f332947a-d7b5-4f68-84d8-3ecce118c24c@kernel.org>
 <rjecpmr4bsedbfhu74sdlzmdz2mh2shsr5myawb3qveooawa3j@i2ysnnyf7hio>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <rjecpmr4bsedbfhu74sdlzmdz2mh2shsr5myawb3qveooawa3j@i2ysnnyf7hio>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_155510_823619_6C7D5F22 
X-CRM114-Status: GOOD (  11.50  )
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

On 02/12/2024 16:45, Siddharth Vadapalli wrote:
>>> the feature to be enabled/disabled via the ACSPCIE block are the same as
>>> well i.e. "register layout can be inferred". The same goes for the
>>> compatibles listed below in my previous reply i.e. they aren't bugs.
>>> Same IP and integration across SoCs and hence reused in the sense of
>>> Hardware and not Software. I hope this clarifies the rationale for the
>>> "reuse".
>>
>>
>> You mix re-use with fallback. These are almost never the same blocks,
>> which you imply here.
> 
> I know that the IP is the same, the bits are the same and those bits enable
> the same functionality of the IP across the SoCs. If you still insist that
> they are not same, I don't know what to say anymore.


You can say what we have been saying on mailing lists all the time:
hardware datasheets lie and sometimes you find one, tiny tiny
difference. If you are uncertain, please consult your SoC maintainer on
this matter.

Best regards,
Krzysztof

