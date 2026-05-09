Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F29CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 13:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oogT53oBlNpwWQnjCTf7meStnZ+vCZK6S5CS4XxdH4I=; b=iA8P+qtdoxZDGWV4xO7sdIyOyx
	GEJh+ivZL/qneenxlNmh7zLKBgQeyanrzdQuWoX7YOdi1QANQC3sojQ6+9LdiM7huJ7UgpeS/zEQg
	lQR3PGr6ctAhbKM5pB8dlzRJz7G/mLEDwUjmPE1dOoIXX0lYbw02GUnY73Ley+4rS4c0VPUxgYfAe
	1tOhrmIlYKK98T6DXdJun/M9szMFBX2AH7OWdCKafXAaIvDbvovSKc4p/xZRKUtQ4zeihReznY4eJ
	BS6Ldsbe0bjZQuJris188xREeozp3x6hL5DrexZHLpF+abaYXPaWBSkhNwxpzwNXGVuTdJ31wLkFs
	JbT1ip5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLhPK-00000008zgj-3jY4;
	Sat, 09 May 2026 13:07:50 +0000
Received: from wp23.hostingpalvelu.fi ([31.217.193.162])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLhPF-00000008ze9-3J9a
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 13:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitmer.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oogT53oBlNpwWQnjCTf7meStnZ+vCZK6S5CS4XxdH4I=; b=Z4xj14u33glyB4U355mwB8jcd8
	QA1eiWqGGxCYuE/+ETZXL14TGRiMa+mpPjjyhFDUPJeEIWlBOUnFY3Lr/frEJtFkPp/CpbWEckhbO
	jio+BrvWrsp2lJ+QwT6B1Lwn8OP7zL5hWk7ErLjYODkxxE79xsrrQJZm8yuyN2ugZb3Uijda4vm17
	LN3ZvgK8aMlxGqw2UWHlkw3sgC542O5JTAN1C2kU99jQC7PFaReTIOgz6iPzR9kCwr++qdxRJcEuL
	5mcXbeTKuqT/dQuUMsTbz7Cd05ChDNHyAYw3+wdWtXmaBbOEWTJ35ItD6uLEEwoGW/e/OQdcBhkif
	ebFErveA==;
Received: from 81-197-209-194.elisa-laajakaista.fi ([81.197.209.194]:41068 helo=[192.168.0.12])
	by wp23.hostingpalvelu.fi with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.2)
	(envelope-from <jarkko.nikula@bitmer.com>)
	id 1wLhP7-00000003Zdn-1iEx;
	Sat, 09 May 2026 16:07:33 +0300
Message-ID: <21e1eeaf-5c8c-488e-89a5-123fc2cc7b1d@bitmer.com>
Date: Sat, 9 May 2026 16:07:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sound: soc: ti: rx51: remove stale reference to
 machine_is_nokia_rx51()
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-omap@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20260509012247.14990-1-enelsonmoore@gmail.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
In-Reply-To: <20260509012247.14990-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - wp23.hostingpalvelu.fi
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bitmer.com
X-Get-Message-Sender-Via: wp23.hostingpalvelu.fi: authenticated_id: jarkko.nikula@bitmer.com
X-Authenticated-Sender: wp23.hostingpalvelu.fi: jarkko.nikula@bitmer.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_060746_099936_75F032BE 
X-CRM114-Status: UNSURE (   6.46  )
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

Hi

On 09/05/2026 4:22 am, Ethan Nelson-Moore wrote:
> The rx51 driver relies on the machine_is_nokia_rx51() macro, which is
> always false since commit 9b7141d01a76 ("ARM: OMAP2+: Drop legacy board
> file for n900"). Its presence prevents the removal of boards no longer
> present in the kernel from arch/arm/tools/mach-types, because the
> machine_is_*() macros are generated from mach-types. Drop this unused
> code.
Not fully true since machine_is_nokia_rx51() still returns true on RX51
(N900) and driver loads successfully both before and after your patch.
But true you may remove this test so please update the commit log and
you may add my tested by tag:

Tested-by: Jarkko Nikula <jarkko.nikula@bitmer.com>

