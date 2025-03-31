Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FF4C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 14:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdvTQJalkKgGpg46yW+cy2ny+k+pwLnIsMQDuMyPfkk=; b=mavK4SMZe/GAq29OpFcSg3b7gb
	7X0E9IlCl5p7L1J+d3IHc6W+urQeZVOpP1U1dQ+KJ8dSmdWDmPYFvnCZgMn8sD18Fn1u299Pzf9n5
	pLnGRNSjSz88orojkSpndwNQfzM5viMt6/ToXpMWJzUNUQ4eNHIgH2mLqJUyoo+LClbTwwTjWXqLq
	uNjZGDQeLiqVdyeoBC+hrzDO8ugcO3KM+QwsW2UcyLmYrT5R2qSWoN8kPBxZta1sfgAK71Km417bT
	yzbOPHMtRXFCKQBROSAkdT/F2uLZIY52SjUwZD09YdOvdxabV08gN/1TxfxnG4hQZs/GeLv9fphdG
	/O7jGo0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFp1-00000000VnL-3w4v;
	Mon, 31 Mar 2025 14:09:03 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFnI-00000000Veb-1Spj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743430025; x=1744034825; i=markus.elfring@web.de;
	bh=gdvTQJalkKgGpg46yW+cy2ny+k+pwLnIsMQDuMyPfkk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tnzgH5Xt6wbTBSwDmUaMD/lstqW32+Rp0vHYm87h79/jovkdQxYxqyASF6nUlIX2
	 JYQvprP2fZWfBPQSEgwVnGU3MsGbpAWtr0+3Kbnk2tiA05H37EFkgEuMUirncuG1P
	 hifJhHhENYmvNW6Y+2UNWhRzWNe7XQihDSbZcgb42NzH0IukSoG6PAO+824iSZD3i
	 rVhGQNag0kCEDj7bnQZZMvn3BhtDfydaCNbFJ+pFjQjmwmqoaIgliATq6vaDhz+3B
	 8Goc7FZ7gY3alQyarryvGKHAtX179nNiPRgWoho3QqZ3q+LSkVwIDugmDyndwT9Sn
	 ieM8wRRIAqww+c5cnQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.37]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N1d7i-1sxMZd0wnY-012Izn; Mon, 31
 Mar 2025 16:07:05 +0200
Message-ID: <96d7676a-ade7-4250-be3f-fd11728c23ee@web.de>
Date: Mon, 31 Mar 2025 16:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>
References: <20250331135128.11881-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v2] driver: tx2: Add NULL check in tx2_uncore_pmu_register
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250331135128.11881-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rvQsaVjLIcFHk0ZTJft0nYrW4clO8feC57kVZ0fPagvI4VIK5OJ
 gJXQU8mFfXoHOVZUv2JL+JNymW9cYMIGUSEWsa3qJJDFBO7WQc0fgj/dKraZB5avpwPm4i0
 Dl9H65dz80TjYJ3kNfFsS8b+vlESi7gOSnwZoZuFcO7mAHqU2r+g8tPOBqly1U+fBxs86g5
 0Ac7xuAxOhCtFS3FmtDjQ==
UI-OutboundReport: notjunk:1;M01:P0:WvlePFoJq3k=;ekmxjxif54ej6eMwJALcA96UWfL
 6bd5F1fr/u2fBaXlLdwk0ay9iQ7IUqXJFubcZZ5xoa91ODYe9CtwEW/eAPcpZRlWTzMPFgKpH
 16exN+QxUyPiEEfnDYMOLyly8KiWkzaphRjfxdsJLrOVanvAvc3UBMbJYLasdG4KbrAko0PiG
 5Lx6HIPbAHsTRM+WSzJlj0oR+SA5+tsrLwpzD/D71Jpo4/0WQI6OlbiKJHQ4jvBUqr808V/CH
 fyG4rTO3OZsD+Z0wGx9B8d5FhAMd1/5lzXu/LhS7dimjIuXfmd74QjYNWeVxpZBLaYzhsI1M2
 Y00FfZeS7ND9NQVvpkzJbN3VOZw3SOXOtJIRG87Kj/hq55JiEvszca++dAxjxjFzlFYpVurH5
 FZk3RExIEYs2z3cGmZDhiFLJTbY5p20ybD8tI3yGPf4TAOFB6DLvxmwKBNgEdOUFnKdye2s9n
 9pU1bNnBz1ynaE7hYzAsDga28tXzbZ3dmXxTyGROdZtyCYhHyaTkukvpaAjLPTK2DcdiP6U/M
 m62vNSUXA43AVTrfEmZ+3QjKRe768wdH7tzpQxr8m5hg9yL6XKHalSnsKU9lnHS/hMPHfSeXi
 ctGr81Wt5A8Q7oxYBCGcEtc1+X+MfVNZpDx4dI5XbmIwkpKBVuWfrpOEMXMoW/tYn2brQtPDL
 kPBuQ3uLNBuNMx8rD8SKIHBrNoEMQV/Gc3SPmlQ+NibYD6zpgMPyMnBvOp2fHd2IYFBngH/L+
 KNNYHx+n9/e+j0GRie83Rttk10z2e8VST+I0lSWqKI1qlliTUZpac/aKDQ/pEuYBr4MY/lj63
 WqB7sMp11p7uyCHVaI86Qxn7hR5JQhiclRExhXx0RJhKGPnNrthGn4ifKSIlgMv6gYq+cV6/A
 fIqd3dlUIAIMJYEzKxeJGtz8D6pLvUhjnLn7SY/NF60DR2e31+N/pIvQSb30dftB4lXfWm87Z
 cy9AJo0t0BLtHidfTuEktogXGBoiy592Qg1yECrTN9oZlA1DWdXNPNqPgOuH/zpU/RH9sZR7N
 NimNuTp5hOwtFYBQ+lK85C5fHOqbq+GM+T46FldEfDeBzT6siJThPz2DI0OmUzGT9/fxJTYxM
 apoaiy6rkfpIA90/EW5djsYN/gZ3WwVsu3l3Maq3hCri0gLjSNxybMSMqe4Fm6DxM4HnOCGkW
 SGMekUZi1ncUchtXd7bXyWgDqz8ckVbMsEj0qMgc3YNTCUFoVW4v0MPOQGpb9Ih4X2ICCptfP
 bYbgvjufEy/EndarkVfr6GlHqdWLmal/nenJA4w1Ui6ywthfkdNJh1C7WKGacq+psEKd5ceGX
 Fmx5pDS/3XKaHaW404xbIaSPkWkxtkqt8fUuUYw+CLPj7uq0VrNghEwCfuAEhd/j02qAeRRSD
 tjpE3eFRil+nNBQEDqHrVWE0SKFYJPNraPbF8p5Hg7ZD7XYniuDkXFGgsjWMopIfZR/ouF/d1
 ISwHuX4r0UM28LTdTFonSTrhnQNb+wXFLTvfguuiiaInYq3cM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_070716_702873_E299603A 
X-CRM114-Status: UNSURE (   5.54  )
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

> devm_kasprintf() return NULL if memory allocation fails. Currently,

                   call returns?                    failed?


> tx2_uncore_pmu_register() does not check for this case, leading to a
> possible NULL pointer dereference.
=E2=80=A6

You may omit the word =E2=80=9Cpossible=E2=80=9D in such a change descript=
ion.


Is any automated source code analysis involved here?
https://cwe.mitre.org/data/definitions/252.html

Regards,
Markus

