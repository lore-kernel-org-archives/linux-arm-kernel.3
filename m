Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB436606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o4i0Rv2F;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tf+bjxgS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4lCaHcGUCMu2QTUG/7Oh7CJPypRTIX/8Km/fNlYAggk=; b=o4i0Rv2F0NGjuA
	znvktD6cT/lImigN54KqTRQiRYd9TJqz2RlIODgAr/FsTNZYuI3zV0aZbamosbPO98jrZYYSFEc1e
	/QxsTIqYmbfEiRP5h6D4uUhcadGO/xQ7+avPT+I/OrTmmOmqYOUQLus+bCyr4At27TP0hegj8gIQ/
	SyzhWyVtRoux7GWmDemxD8KVkJpBsR84yO/iPZPZIkSJEKcHwzZpDNyhacAt/4ozbgGehPrdFkygC
	06Txpum68useAiiqAxzvsXEgZh2BdcsvH/WJgqNPzm7pvnyzbgSJ4dbhCpYhU+b4hmL4XQh0tYvUw
	2KKYjZ5wf1DY0BM4zKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqT7-0000000GNdr-2J2h;
	Mon, 02 Nov 2026 11:44:53 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqT5-0000000GNdV-20EB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:44:52 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so2981343a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 03:44:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793619889; cv=none;
        d=google.com; s=arc-20260327;
        b=bHNXBey1gZpmPk5eL0Q7v9+ng2qV+EMx1s6jce3cq+9igZo4Ei0+Ya/4wTVj1AsX3t
         YwVUOCW9YoD9Bjbu1cn4Era5vNAM+qeLthyPAbrMoiH6myLbtvt/1Gu0rOz00mayurI2
         qRoWP+T08ykerkzoVztMmlW0jRSLnOsuV1UcbH5Tdbf39WWlxEBhwEMLPSmZrrArDLe/
         gRoKxhe78xENwsK26QZIdIV6ROaLHXJyXpV00OUX4U5LeAc/CsAZLGVehlx78Cx6LdDq
         SmuZ2wHQC0f1k8pc1WeUOkJLf8/G685bbM/+k7Ylo1fTFD5ZTQhvB9It7GFZDHh7IIRi
         8kNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4lCaHcGUCMu2QTUG/7Oh7CJPypRTIX/8Km/fNlYAggk=;
        fh=LEoLQx/yEPQCNscEC2eP8XahVd4whUF8Ino3j14EaCU=;
        b=MQCzaRx50EScdWKpoXGBOeD0usMsHYuo9HcGsZP4tJZl1kEDYqaPqe2J3XGfnwikpH
         WuCBp06eRhkKk7OYq5d+uPimcK7Bzokk4Fq/D/ovZksW7wLT7hMba3RFmR8M3HEsXuQv
         CNhJAylGhJlOglNzFs/PbW4DQUpzpLJgeS+IO/ap8j0YQAODQSkoZm4iDmqGZmMdKvRO
         XrlSipxAU5hDBX31VFJoGSnxqxfXwxPSQMwBUl5WeT8L9I8wXfFw+7Oijg7k6s2O3mC9
         2BsF0SshvtzKq0LLpPPlaswO3dd8aWpvGkiwOYbXP9PlTwjLIFm67FK1EboJd7kaCI90
         SuOg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793619889; x=1794224689; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4lCaHcGUCMu2QTUG/7Oh7CJPypRTIX/8Km/fNlYAggk=;
        b=tf+bjxgS2gPLfH2WGU51L1FSUdK63x1sWPo3tpl68kXLImFKkSI6d0i3QDZLuK7dK7
         BFxurE/GSpwvWeC7ITarMKJeFNkRJStfyb4/jnNG1W82ofGJhEvK5Sq1CBcjacyzWpi5
         8a1ZN7dKANgU6oBINms+fZHqPLW6JgDCNbgfwhvi42IQNlbLO6dRBrs0+OkLZAeGyPnf
         Q88nOdeFdomaL3XaYjYnJlt7ckBOj4GHR/TARzMlt6cCmn3K0dtJeTaDT66GoUAQ11od
         zyRm+QaFCHKowJY7by0RUPoUd/eYOMGt4GwWhXRPt0zh3JF97I+TfRXBqNfP8975WkmR
         VWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619889; x=1794224689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lCaHcGUCMu2QTUG/7Oh7CJPypRTIX/8Km/fNlYAggk=;
        b=B7tZXJzUjqO7ageyPEv2ug9p3zKjzxZcg4V0T2GurSEI58K9ExKM5By0lVcPA0HCSW
         yZx4MP6A/l+MK0mKOcuXaN88oIicnoX1bsCRJXtMdonr8g5TavtI35gygggfYKvyiVAp
         E4NmQSLwsRpgkiKuPukmN1d9J5JnEpFG4FYCYDDSdAFRVX9CB0tx0GKTpXa53591Bd+t
         XPcIOjb7dHl2etkqM8m8ABL6fidxYyLbRwiXntmPdXMrKNxY4ARKTczqW6+QubGj6GYq
         o4BBBvCucQDpxM/TPQQgo6prbI2Amu3BI2N4Ft7GYale66f2RiSo1GkG4Mw3fba3HT+w
         ow8g==
X-Forwarded-Encrypted: i=1; AKwUvBxL4+eymcpY+R44/fu2KuZow0DdRBMANAMssV9Fy2vfYEPvtB+7PZs4RS4ZiNm2r11dob8JzzHhaLudsfX1gWFG@lists.infradead.org
X-Gm-Message-State: APuU4Z9sNYZf+5mvzkzbd+VZOn3NDTmeAj48BTBJ+Aa7kE3a8Ccjrvvn
	vJaL37TV6NqSdflpry9uCXQpoR9uPRmoiAH/MDB1twa1jAAoPY74TMmWqucm/EjSbPRVojj8MnM
	1GyfyxHcT0wSxCGmseuIO6Z20ckTm2zc=
X-Gm-Gg: AYBFou04mP80qrexMmngA2+J7Z+WglcVMwDjGMqse9nZWnFeYptQsqlnmZ8gLMbyN7F
	cf7ROfuPCN2YYwXBqWAa+X0L/Fq7O/A18YR9JjvPcUr3X7SfxswxVTWExH5+QfkXq8fE9Y8LUE9
	UaxaA2YrrZdHAu3LSuJ/96gJ24puQyTkW0JScD34t+4wCSbqsCQDEZ7prF+Z7b6hKn6dWiAgUYy
	OP/y0GO/11OuDz8GFdVABNdcOgXWTrXqlId+ellvMMniWXpNuXasDzAIFF6PyYlJufXzsRd+gmA
	JTaq/9aA3gfjfJK9dUZzmVWWr8tmR+LwxCkycsKeD99Ew7x+HU4izFHdP+ZjDeSNiRh6W243hmn
	NMWwVkeJT37rpvCZzO37hwmAmb3S4IYNomzvDXeWoDDnO6OLMeYve7DEtXlfZJ6Z2StKqD1c=
X-Received: by 2002:aa7:c1cc:0:b0:6b3:f840:59b5 with SMTP id
 4fb4d7f45d1cf-6b4d4c71d29mr4850911a12.27.1793619889068; Mon, 02 Nov 2026
 03:44:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260927131838.6774-1-demyansh@gmail.com> <20260927184414.6c0c8867@pumpkin>
 <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
In-Reply-To: <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
From: saeed bishara <saeed.bishara.os@gmail.com>
Date: Mon, 2 Nov 2026 13:44:37 +0200
X-Gm-Features: AclHuK9z8jjLcwsnJfsDSIZ0apXZZySDKKpQ7s2Xoes3fbuqIuVEpNRNi2DB1ZE
Message-ID: <CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
To: Demian Shulhan <demyansh@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Marco Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_034451_530355_941AE8D7 
X-CRM114-Status: GOOD (  15.29  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@gmail.com> =
wrote:
>
> I would prefer to keep only the scalar version of the fused copy+csum.
> It reads the data once instead of twice, and on real Armv9 hardware it
> cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> depending on the core (+6-8% throughput). It uses only general-purpose
> registers, so there is no FPSIMD state to save and it is safe in any
> context.
>
> If you are OK with the scalar path, I can send v2 with NEON dropped,
> the scalar path only, and the KUnit fix for the x86 zero-length case
> Jakub reported.
>
The scalar path seems like generic C code and not restricted to arm64,
curious how that performs against existing (e.g. x86) assembly
optimized implementation.
saeed

