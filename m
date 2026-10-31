Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C42E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GoHtGZ2j;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=iOnYndQv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qR0DGjbS3VPeXKtuCsRN8V74OoIEh8cWN9/0vorUk0M=; b=GoHtGZ2j6ACMJG
	KADuv5UjpHFtITGLL5TrbSuTmgS27Ca9u13AKb9/a3MTs+MySmW6Bo4lMaFqd7vOYvEFtHAi3lSnD
	DUYrws2sMJK+SrH0xv2KLg9/nCb+EP0UW25IIW1gzJm0SzW7AlE6NsDwUDWPN+w0ES3aFj21LGM1Q
	FMTLzw72JMgm7hr6jeH2R05u8TYIe3GMIFmbEs5MsZ92TarQ3eQDY3n5a/57tdqgozIs1Qyo82Rh6
	sokY7NFZ7P0/V/Cu20hrPvofCcgLvV8QEuXF+A+dw3GPFW+kBWjOVCaDTDXdsffa+BuRKKGA6xiln
	U0VPRqmD3aM1z/MjzXdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN9F3-0000000DMlr-2dJ0;
	Sat, 31 Oct 2026 13:35:29 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN9F1-0000000DMlW-0BkB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 13:35:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3F3910C1B8;
	Sat, 31 Oct 2026 14:35:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793453715;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qR0DGjbS3VPeXKtuCsRN8V74OoIEh8cWN9/0vorUk0M=;
	b=iOnYndQv0hHIs5gUv4GuN2dOQ22WQjGrLex9fKcrvEx9FvgzZ+VNX0qtYcTxY8R24V9jJw
	921TFtgmDmHC71Ibrtu3HrPYbAJB9ffKfUGlpV3zmoJoMuc3qfln7jekP7qWeTVLaS99ZH
	nSVNgHKLf1fVDu5UBhDHT9PiCJ4KucP9THD8UIqeMb6c2wPjAELpUJxdlxeivS7CJMHvSO
	5AMuqPgYn8iWBrNYNgbMvmIK9Dca87GbyIGMK3tc63JtCesHG8gtzUINIQqgbZ4xJdthGN
	3+T7455CSkL/84iyB74fih+RDb/hR3dH7C2xgaeSto6cvJJFWZi4+fLVfnLV7w==
Message-ID: <7ff5f937-144b-41fc-ab0d-82271a01dde1@nabladev.com>
Date: Sat, 31 Oct 2026 14:35:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: fix arm,smc-id of the SMC watchdog on
 stm32mp2
To: mateusz.nowicki@posteo.net, Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas BOURGOIN <thomas.bourgoin@st.com>, Rob Herring <robh@kernel.org>,
 krzk+dt@kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Lionel DEBIEVE <lionel.debieve@foss.st.com>,
 Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel <kernel@dh-electronics.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Fabrice GASNIER <fabrice.gasnier@foss.st.com>,
 Stefano Babic <sbabic@nabladev.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>
References: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
 <7ee09655-2fef-4334-b0aa-b56f7ae03f74@foss.st.com>
 <1b14e1e4-962f-4391-91fd-b09143641643@nabladev.com>
 <cbcb8d78-51f3-41ab-80d6-fe3f0623da5c@app.fastmail.com>
 <f7010f07fdcdb4ff04a0dbfac1cc5421@posteo.net>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <f7010f07fdcdb4ff04a0dbfac1cc5421@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_063527_308307_E20DE399 
X-CRM114-Status: GOOD (  14.42  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/31/26 1:00 PM, mateusz.nowicki@posteo.net wrote:

Hello Mateusz,

> Marek, would that work for the DHCOS boards? I can send the patch if
> you tell me which of them ship the old OP-TEE. Your OP-TEE change to
> accept both IDs is a good mitigation on top of it for anybody who
> updates the firmware.

I do not think revert of this patch is the right approach here. I also 
do not think patching the arm,smc-id in board DT is the right approach. 
Both of those, because we do not know which SMC ID is the correct one 
(we do not know which firmware is running and how it is configured, see 
the OP-TEE OS CFG_WDT_SM_HANDLER_ID which is user configurable, and as 
far as I can tell, the SMC ID is not discoverable, or is it?).

But maybe there is some way to probe for the correct ARM SMC WDT ID ? (I 
do not think we can infer the ID from e.g. OP-TEE OS version, because of 
the CFG_WDT_SM_HANDLER_ID user configuration).

In case of this SoC, we can mostly assume that the SMC IDs will be one 
of the two, 0xb200005a or 0xbc000000, so maybe we can extend the SMC WDT 
driver to support some sort of fallback -- if the primary SMC ID fails 
as not supported, try the secondary one ?

As for the DHCOS boards, those are evalboards, their bootloader can be 
easily updated, and they are running recent software more often than 
not, there this topic is mostly a non-issue. There is however hardware 
which does have downstream DTs which pull in upstream DTSIs .

