Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CC8C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O06P188+t5IkMOcphaknKbtZTwStMyYbeSy3ILdznBw=; b=Yr8S1op6jrySiiqhM2BfF8TTvT
	otGEiYE9fAjHi98viNICuEgCC8L08kkTEz4dF4tZX5KTYYPuDNFsNnOH91ny9QBkb6Z2ClDEFUiLE
	ekbMCAzh6aeU1vcL72Y8nBglPFELBkDt9wK2F/OeS6ElorKJCYmaBYwQodfCSsH9y7grq66Gh05V8
	EFm9tl6QV4TEYgdtBbshY7/zzWwx2KyzTAH17UBB8S1HaZcrkc69u8d4kp+lgV/tsSGxoVYc/hof0
	gABPwR43PQFCpME75/gWRae1yTQghVL59HAOxB6wTdfWnE0chlKTKjS7duQ1X+dQxzqWMr90EtB69
	uIg20hMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMNk-00000008br5-47pz;
	Wed, 12 Mar 2025 13:44:24 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLye-00000008Y4Q-3xaL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 13:18:30 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e455bf1f4d3so5046636276.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 06:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741785508; x=1742390308; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O06P188+t5IkMOcphaknKbtZTwStMyYbeSy3ILdznBw=;
        b=VKSq/K8EXmbJGyJNY1PF/xNyciyz7AESO6xM+xsvnTXgX86B9fsYJAH3MaHZAEbwJQ
         JyZMn1OATeUUomBbi3rdqAAHt+7ft4hRjma5IQ4IAljbGMUBGdf26Gcg/3M5dyPY9kIY
         nngoC+MQyGZMmpm2LBHl5wx5R/pZJWDNwXdCYeb2b+VJ3znSeqQCWAAcNwNPv56sS1H1
         sJQKGwSoOukY80OCcJN6Y0u2loC7gNBY6eokdR8QrKl2ZmEqswGA9YHskaoiHizIIkYA
         qmTfTmHuc77pPiPQinI6wd5BWJ6oYqyHUfcYn95AlqHIp+CoxEl+pB49G1PF/wzmBD62
         NWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741785508; x=1742390308;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O06P188+t5IkMOcphaknKbtZTwStMyYbeSy3ILdznBw=;
        b=vUpt0cZOcd9xiolVqRZTEjFki9xxB7mYc1YTHOg0J6W+CcM2YPvs6VefGjpp6Putp+
         fqHa54uVnrEvVXs12SkKb8h9/GrLtVmnX2T8xgl2+Zmbp7fwvKESnuY2HvuUQQH1eU11
         Q1G7H0PfVHydGp7HIJ64kOfYQkgxncCoUY+noK1nwmbrLALNiiIWuEPq5CKWcSsGlG8a
         +MnGhhKRf3Aq+jOs+2XyDngKtkw350AFAqyd9i5WCI/3kNk2rPoXNPccL9SpxC+tVRI1
         55ras6L1EvpA6xXXPjK3MZalJBoPXukE3edgQMeXtaPEU5DHi5ZesUbpednuMaohR84T
         efkg==
X-Forwarded-Encrypted: i=1; AJvYcCXhEt4ZSoogE1yqTIp+0uugMuV2494DsnhBGkk1ubKeCaJ4o3VO2KrS7dxyas14JxQ5rMXDawNsXCNSw0/Svd4T@lists.infradead.org
X-Gm-Message-State: AOJu0YzuLRdJ5ct6gm0iRUn+CJgGChPycopksyNaNTbq75+MxudVNy0o
	zMlpSmU9F9tZQ1c1cBhIbKPYiUSbXN8vHu5NR7MN+XFaN6BFcYa1SwZgk/Won5YSAHxHVbtBjKc
	340RAIshch4eWmZsksmkTZMRUbNrxKHj5DViU5JIQZJ7UdYimPOk=
X-Gm-Gg: ASbGncvy5g6tLHJ/MQ7BiY3W5f1zmpot890u69mIL6iQw/yyu26h/aaKdr47FER4pH3
	pPutikio4vc0bUqmWQ9tycLNYlEOTCHYB+HpHBt102iUrFxlFR4+XB2A9w528Rtz4AjNY+r6Iea
	mNH+LtJi9tGaUgAWnOoaKHEMHa1+Q=
X-Google-Smtp-Source: AGHT+IGyzl7GwHaLZh3ygs+nju2rxMd7dGI+ZgAL00mTmKBqCqVGTlKAadXsmQ+m/M2fSAfYzFe/Q76nG6skzC09EPE=
X-Received: by 2002:a05:690c:6c02:b0:6e9:e097:718c with SMTP id
 00721157ae682-6febf2a450bmr305445347b3.6.1741785507753; Wed, 12 Mar 2025
 06:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250206220940.10553-1-kamal.dasu@broadcom.com>
 <CAPDyKFq1ZbP4c9ECfM1SY+MEopf+dC19w9PkqXaUjevf=bPjcw@mail.gmail.com>
 <115a59e1-75b2-4d09-bbf9-50dfcd2b62dd@broadcom.com> <PH7PR16MB61967C18645C64E582B222B6E5FD2@PH7PR16MB6196.namprd16.prod.outlook.com>
 <d51a9d7a-b942-4c3b-93d2-65b1bb04c8da@broadcom.com>
In-Reply-To: <d51a9d7a-b942-4c3b-93d2-65b1bb04c8da@broadcom.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 14:17:52 +0100
X-Gm-Features: AQ5f1JqTx3pgXMeqFgFpSDIaSNIKY2an6JSCt033D3YeuQR5aENCOVJYaG8WOzA
Message-ID: <CAPDyKFrCjo8gGnxmXWP6V39N+b1o62VQH9zwMUNb2_+D3-qrdw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] mmc: sdhci-brcmstb: Add rpmb sharing support
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Avri Altman <Avri.Altman@sandisk.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>, 
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, 
	"bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_061828_983936_1FA3D22C 
X-CRM114-Status: GOOD (  20.76  )
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

On Tue, 11 Feb 2025 at 18:01, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 2/11/25 00:13, Avri Altman wrote:
> >>>> This patch set adds support for Broadcom TZOS to read and write to
> >>>> RPMB partition using synchronized access to the controller hardware.
> > Practically it establishes a communication channel between the trust zone and the host controller regardless of the rpmb protocol.
> > Or did I get it wrong?
>
> Rather than communication channel, I would describe it as an arbitration
> scheme between N participants, with guaranteed forward progress and
> fairness between all participants.

A scheduler in the MMC controller HW?

Nevertheless, it means bypassing the I/O scheduler in Linux and the
mmc block layer, kind of breaking "fairness" from Linux point of view.

>
> The interest here is for one of those participants to own the eMMC
> controller for a certain amount of time and indicate when it is done
> with it. This is not specific to eMMC as this could scale to virtually
> any piece of HW that is driven by transactions from a CPU, but the main
> application is for allowing the Trusted OS to own the eMMC controller
> for a short period of time in order to do its RPMB access, and then give
> it back in the same state it found it to the next participant.

Honestly, I think this is a really terrible idea, sorry.

Data and communication with an eMMC needs to be synchronized and
managed by a single owner. Having multiple clients with their own
channel to the eMMC sounds prone to problems. Is each client going to
have its own mmc protocol stack, dealing with eMMC initialization,
data-synchronization and power-management, etc?

As I said, we now have the RPMB subsystem for in-kernel access. Please
use it instead.

Kind regards
Uffe

