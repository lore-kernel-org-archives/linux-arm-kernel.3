Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D008610A62C3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9Chy8AgzevwPYn3/hEg4YkH331ROLRWKE0sUs35RwM=; b=RqlF46LSJILS/7t7hFzbdWzzt6
	4wElBly+zEr3TGNfjcfNfLOrLWQz78Xq0vZRaERa1Ic0DkaZvAqxqhjN/2YE+jHwO8Kmt9Y1RI/lO
	Pbjhp3fBs8QrVp0wX6eReOKthRz7qmU51EG4oW5P/MEts3dgv1FAnmkxIlgYo88NZwiC8PfiyeO1Z
	9SSdR+0e8Uy2PJdbzYYe8N9lZ2h8NMX1xNz5tJNsD+DTeh7VshD9I95t+cxxf4JGNTL6jb8P9OBPD
	4jlDMXd+P30lrbBEYjIl51sRlc3O3Pzvpk1rDDByGN/f4mAtoEwf/igfEmwp2ykVUdSghgdMYtaOB
	32C4rIAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kCA-00000005Uc3-1Oe4;
	Thu, 26 Mar 2026 12:52:18 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kC6-00000005UbY-44Oj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 12:52:16 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fhNvv6ZCHz9ttG;
	Thu, 26 Mar 2026 13:52:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774529532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9Chy8AgzevwPYn3/hEg4YkH331ROLRWKE0sUs35RwM=;
	b=YTUZUxBJ3RzbZuMkbGTZyU2cHqO5J0MT0pTPXjOb2ufwyEWX68TABeLbIdZ6TTFW8NEUOE
	P1+/i2GWHb1Cib/0vLXXR6g7XQUeUX/hO1Whwl2tcp5uNzbJmRznafMAjZHjyY/2km/S1M
	gT3etrZkBCwElSlOKKu9a0W3DI9iX0q1yEzOZEkaQAEPf+h2IEm7Cn5Rvz6Qvsdrcgghpz
	R7hlL4mrxyK/VBB9KpDJj5pi944csDVKuECCPMet9ZczEuGcLXK589E4Temv0hz1gXWtKz
	rGnJoiAQzqFUrVMlFYApYJ/TBW8FlNf8+WTmMz2SHWYqhcKuGBredCBIkiJqcw==
Message-ID: <d6696825-f739-4427-bb60-abf8afd82b66@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774529530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9Chy8AgzevwPYn3/hEg4YkH331ROLRWKE0sUs35RwM=;
	b=MEKXNnKQsTujq/wMDVDbuIdq5AnzVzA2L09JW/JbiGZfyOu3FYlqpvMBmY2GUCMUEuAMBV
	nQtejxsfaEMlF2MMKxv6dyrLQTs+myKV94u8hCtg2A2Eu+LrHZhpW687mcYMXUKiMYXJ7K
	QMaSwH6OMgxcDkR29L1ddHEY/vT0UOFwpJHCVTDD6geM9dwIViDOAESqUZd4qEzlO7wXgK
	4t2gEG/OItcvI0DW9GXe5R3shX0MJEHiHJecdGyUHTMd8vWXUSmpb1TtOIvgA0mHKaYiSg
	BqVyXddH4uXWUbwNcdgCkBDuxgA6xghOJy4MoCDY4ervnisz3eDucMI2mZnNRg==
Date: Thu, 26 Mar 2026 13:52:07 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] ARM: dts: renesas: rza2mevb: Drop RTL8211F PHY C22
 compatible string
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260326045416.223556-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVwa47N2VsvH8pBkAD215dr3M-qkA0SXed0vhLS2-aoKA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVwa47N2VsvH8pBkAD215dr3M-qkA0SXed0vhLS2-aoKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 0aa1a6b254c98a861e0
X-MBO-RS-META: 89mianiegazzsg9eorrsbp6xffnu78nw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_055215_181746_5BA1C5D5 
X-CRM114-Status: UNSURE (   8.48  )
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

On 3/26/26 10:45 AM, Geert Uytterhoeven wrote:

Hello Geert,

> On Thu, 26 Mar 2026 at 05:54, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Realtek RTL8211F PHY schema indicates that compatible string
>> "ethernet-phy-id001c.c916" must not be followed by any other
> 
> This is actually RTL8201F / c816; I will fix this while applying.
Ouf ... thank you.

