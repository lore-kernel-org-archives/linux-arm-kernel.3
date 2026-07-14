Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BCDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufLIoxCqOj4lRPvwdKpAdX3iK89Os4w5B6Mc/e3OELM=; b=Uytg1g1neX1CaUKh/Iy9mx1kl6
	QsmleUYHeP6re+5WR0a0fb2si+KHrwE4fdLFjBU2EhaRa9UtbjJ0pFmBgywLx2c7+hr7kyUmGW2xD
	9Ew3Ngiq3+ryjJR54SsBENRKmr8b6QEPNaEZqLKbAUV3zlTE0A1YZrvxwZsIDveVQNpDEM/gAnxWR
	ktGWGfFzzK83H/LJ/gvtEBDqb/MfMCGUgu4/ibva0iBFmQUK5j9soKN6S8FPQxpx9zy7iff7+vjhK
	tLkiMtdfLQuVCNcKq9O0SEqIyTIsi7oDoPrxA6uPN4+gnH5BgbpKSSW2kcbGQNDyr+lSefx4QFUKI
	tj/QYe0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdM7-0000000CCmk-1bXk;
	Tue, 14 Jul 2026 13:39:27 +0000
Received: from vinatta.cz ([2a03:3b40:fe:428::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdM5-0000000CClb-2bdB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:39:26 +0000
DKIM-Signature: a=rsa-sha256; bh=ufLIoxCqOj4lRPvwdKpAdX3iK89Os4w5B6Mc/e3OELM=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1784035414; v=1; x=1784467414;
 b=rDtmI42/6ALxoqMnfSCLl1YOOeTloOtKSVEy7dZv4CHlxWHNCdtHJtu/aAnwj8HVxnxgdHIz
 XzalY5Clo5EW4iy+Q7CPRkTlv9Pf4N6xS7YB22uWdUZpIzFAhlDPTIfrCzdCsPbPLp1b7iRwKg/
 LT5iBqy2894L24SN6VG/E4MqLJ/iE8W2ANxM8xonwa8Koa/Z3EmnRuKV6+NLB7pBKrjcXdMIZmU
 7jkQcWL+9x0vfZs9QEVsu4GwZTx0ulNr/+BVFsSLTORGXXf39NvIwWz15ZQ93MP+m1r8CIRPqzu
 h6dVBzqyapGrObQS2hM6kcwTdKwXuMmrkU+djESD4GapQ==
Received: by vinatta.cz (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 2673a385; Tue, 14 Jul 2026 15:23:34 +0200
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
To: mturquette@baylibre.com, sboyd@kernel.org, Chen Ni <nichen@iscas.ac.cn>
Cc: bmasney@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chen Ni <nichen@iscas.ac.cn>
Subject: Re: [PATCH] clk: mmp: pxa1908-apbcp: Remove unneeded semicolon
Date: Tue, 14 Jul 2026 15:23:33 +0200
Message-ID: <y7gzD4oyTSKcEA7YFhq5-g@dujemihanovic.xyz>
In-Reply-To: <20260714053059.3219704-1-nichen@iscas.ac.cn>
References: <20260714053059.3219704-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Autocrypt: addr=duje@dujemihanovic.xyz;
 keydata=
 mDMEabRVUBYJKwYBBAHaRw8BAQdAG5VJBpoPRIGQml4+E2LcPdyVtnXRuuqoD1BsHxRjNQ60KER
 1amUgTWloYW5vdmnEhyA8ZHVqZUBkdWplbWloYW5vdmljLnh5ej6ImQQTFgoAQRYhBJvUYwF2kA
 idqo3CZidfVEs7G0eSBQJptFVQAhsDBQkFo5qABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAA
 AoJECdfVEs7G0eStq0A/1SDcm8Bkq1JV+GTGMC8qE1QzCFvnoJuZqtUuQRCkd31AP9Mbc3pmg1K
 JDxgPl17/CQohZ98dbUVffmdQpJJLLMsArgzBGm0VXYWCSsGAQQB2kcPAQEHQH8nnS6QNfgpc1Y
 tqU80DWMWMsDPEGJ7yZ9Nf90mPEEQiPUEGBYKACYWIQSb1GMBdpAInaqNwmYnX1RLOxtHkgUCab
 RVdgIbAgUJBaOagACBCRAnX1RLOxtHknYgBBkWCgAdFiEEA6Ue0g5lV5FAcj1ivjIt18NZWcUFA
 mm0VXYACgkQvjIt18NZWcUyDwEA5OK1WRFN4/psOq/bS6Wuh5ysy0CyXIydqIwDJDdAFukA+wfc
 lr1qyAbEX0FHVunCl+sxv/ymvjsup85rAH+a2j8HA7gBAIolabvAIUTUfCQNCu5MUt482b2EC8K
 40xl/6HT43dunAQCqxwRLI2k0xmTdia2AZwqbbMvqWonOLWtdZwWvodgjBLg4BGm0VaASCisGAQ
 QBl1UBBQEBB0CoqkQL2R15WHRvj3RlkxjW3pPpZVUOHyfhEX+Q9PhTcwMBCAeIfgQYFgoAJhYhB
 JvUYwF2kAidqo3CZidfVEs7G0eSBQJptFWgAhsMBQkFo5qAAAoJECdfVEs7G0eSnB0A/3oyRxS5
 cUJMNnM1+4UkRahmU5/42NfVOxIL5d5oaW13AQD617LpOfnCuZR3U0vHLOW5vrnFtdvi32N5zLD
 9wyShC7gzBGm0VbYWCSsGAQQB2kcPAQEHQPRL1mWe9nIhjicyAqqEN80IXEF0NeKSFFpN8n75b2
 YIiH4EGBYKACYWIQSb1GMBdpAInaqNwmYnX1RLOxtHkgUCabRVtgIbIAUJBaOagAAKCRAnX1RLO
 xtHktyGAQCJPD6JsQhQZEB8ciZrJz+hnonsJp+KZZQQGEK/KsLHEgD/ePz/x0pQdI/DcJd/5Qge
 +IJGd+jyv4zyevPxipVbyAo=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_063925_806819_A9318AE0 
X-CRM114-Status: UNSURE (   4.95  )
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

On Tuesday, 14 July 2026 07:30:59 Central European Summer Time Chen Ni wrot=
e:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
>=20
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Acked-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>

Regards,
=2D-
Duje



