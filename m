Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D1F606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vlhDyaZ4;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=XwsE/OKh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+G4rf1hzJmKdD7EoOaWqne7TUKWl699YR7p6ZHK04Pg=; b=vlhDyaZ4XwR0rg
	+T23I/jT22B2IY1pJCbMnrVDKhSWfOpvD+G0zhuVEZfqz/l2xzRDnEiwppTy7GkAmU1uvUeQxmdMN
	6e/fkr31r9/KaqvXTzT8MkGvN9eCsRVvlVZHwXjChCPyPOOq86zI/BKhYmJ8htzVhmMfTc4q8dtNn
	u4Zygmd9x35T/Y3GveRllfwi8fJVNrfbGDwNpjXTm2e1JREsspAo/Fw1o840gIqSj6KBqHUfoNl8/
	vgjLiXZJhUlgA1RdAUNrWkyujZUjfw0/ubzropYbWe0o8JLp33mU0lXDOvuBVpjGmkTjnw4ekvvNO
	GGHTsgXSzFA3Nl0FvA1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfsG-00000006Q5n-2bMy;
	Wed, 04 Nov 2026 18:38:16 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfsD-00000006Q3i-1kut;
	Wed, 04 Nov 2026 18:38:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793817483; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=jOiOl+0CE+ACVKVx2qnxTLmr810zE/CRa3KOwEr2zNkoJc25NbMCCdee3UXcgi4SvHxIB9BtXeTa0IVCXrN70PWks0O6lrv3nUDrmsbs7zmRhW0uVtNFMd0VTFsWtSr8+/uuFcaXlBFobGvMea9hXuGXpJvGRq1hcefv3O2S7cE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793817483; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+G4rf1hzJmKdD7EoOaWqne7TUKWl699YR7p6ZHK04Pg=; 
	b=KMm2Qa0cQcm1Y27OQJWy4TNMM30UFPAzO1jo5bniPHxWFY0Eda/ucpPhYTde4l6Pg2NFIbfnvQFVZX1Ll+NpPo+lgbZt1jPYyQdzP1mocMFucUS2ZDb6+KaOPLwNzr7Ds4lccHlD684uAul0XSMWEoK4teQbqi8DSwUGyg4TaIs=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=XwsE/OKhgSV8BT27J+m5RtLTpGlmD2r5OAJQBoml3G3mJAKrH4UlhmUacSyvaKRjiVf6jv2WIYpVW3Zf1hnYQuMIP8iVKsbm/g6dLhyYNPkj9JoZW4z3McwqHJCweLV6luJLFyFNmNcj9d8s1sIjsmdVL0IaFCIvnJVaF1p0uAk=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=+G4rf1hzJmKdD7EoOaWqne7TUKWl699YR7p6ZHK04Pg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793817481738396.6696032790776;
	Wed, 4 Nov 2026 19:38:01 +0100 (CET)
Date: Wed, 04 Nov 2026 20:38:00 +0200
From: Igor Velkov <iav@iav.lv>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: iav@iav.lv, John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Miroslav Lichvar <mlichvar@redhat.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] alarmtimer: Choose the wakeup RTC per sleep state from the device tree
Message-ID: <20261104-alarmtimer-rtc-neil-reply-1@iav.lv>
In-Reply-To: <399668f0-e97a-438e-b761-1ea6c18d904b@linaro.org>
References: <20261104-b4-alarmtimer-rtc-priority-v1-0-e996681b8086@iav.lv>
 <399668f0-e97a-438e-b761-1ea6c18d904b@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_103813_736143_2AFC9E9B 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/26, Neil Armstrong wrote:
> This sounds bulky, perhaps it would be much simpler if we just added
> all the available RTCs which has RTC_FEATURE_ALARM and can wakeup ?
>
> Just switch from 1 single to multiple RTCs in a linked list and you're
> done, no DT & bindings changes.

A list it is, and v2 drops linux,alarmtimer-priority.

Arming every RTC makes the coarsest one fire first: pcf8563 has no
alarm seconds, so its alarm comes up to 59 s early, and an RTC with
alarm_offset_max wakes earlier still. The board wakes before the timer
expires, and the next alarm may come seconds later: while it is still
resuming, which takes seconds with disks and PCIe, or right after it
is suspended again. Drivers then go through suspend and resume at
short intervals. Arming one RTC per sleep state avoids that, and which
RTC wakes from which state is board knowledge, so v2 keeps
linux,wakeup-states.

--
Igor Velkov

