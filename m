Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7852F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 06:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4ert3iLq;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wsp3T9/W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5KBUz5itfW2H0npvZHDcjaGSjYLfy+DCPcwOiE7R4cY=; b=4ert3iLq1S8hpFDzd16UfY7oG0
	EKSqD5FhQvAJMm4ggFdKCrkk3tJdQEStABeQAK2SbwQBk0HgLkSBAnzdcFTM8oVh51rPkE70gTAiA
	QORo0Nxrp/HUHBBN4nTKqt2h21RcbNNnOwBqle6EJFGYvvVYCceqKh9gUbAIbo4oAcS+jZxKEfqWK
	BJdT0H3bFcPW+3V7KJIJ20xPfJ2k+s+3FV+je5iUTskrnVozXVC8LPmH/GH/G1cOTt6WrmsDwlSP0
	Tjh36CKHjfq0qg4TrxN5wcMFvcyxb77db8uKaNQm1aVwLXSmxgD0pipdx6otwkfLlRA61rtq+xYe2
	LaErTkiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD4u-0000000BJRB-1WeE;
	Fri, 06 Nov 2026 06:05:32 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD4r-0000000BJQp-2Th9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 06:05:31 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8a06454116eso116141b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 22:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945128; x=1794549928; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5KBUz5itfW2H0npvZHDcjaGSjYLfy+DCPcwOiE7R4cY=;
        b=Wsp3T9/WXh/2znbQUd88jLpSQck8Tg/PO/Q+lyujQ2BIeYsp2MCMJms7Vpxm/93bNm
         9Ef6zxCkk8SHaktiF3+YLJTWoCPd3wHZqDhuWDnFrs2JemSEZa1a/NAidx3C5RZGq35U
         Ihz1oycqjYpJCJ6+q12De6L0cqw7yyiJfHA2urWQUUc76jMUy7EUS08SeQPNm+Qktz7w
         wDwlaRRD92UfHsGO4bQ8rMR47mJorrfVasBKSRQkGnlqLjrqv+ILBjAGHwwbcMU5kKNS
         7SlDU1SDcGpYquYOL0SMvgiyRXkYX9sA+nsJ0PcXQKCUVOdhZBA3tA8KRa2zWbdsd4E/
         hmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945128; x=1794549928;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5KBUz5itfW2H0npvZHDcjaGSjYLfy+DCPcwOiE7R4cY=;
        b=zFhNyWBEcD/Yb6cI4B+ebtUxMG7A9Pq4pAGJMjSXiZDTpagFTl000sHnnnC3SBGz58
         cEo6ebQfhvA9UMvecRtlfZ2uAgHkBT1AK9FEO23Jpe1K/PM2yU3WeSj8Yial1H/gRxEj
         yZZPtKzFx0ts5UrFVkzWKEZcqn1UH/4dgN9Ya+bJMOWycLAz3vNsP+j3fQKcG7sJ1ZoJ
         Co915Xd6kV8lBwBYqmr/951PYj4rcqpfR2Vx4ZZLKK3K1oNSPMe7Rrizk9hOJB0b7xpn
         cxSY1m6hNfcFR+bcLnslaONrmdHZYRuSwPMAxqEDR05BhWWoPVyvUOlq28fnWT4bIzIO
         TSdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsE5TGFnAuYuQzAZJUpekn/x2ESUi8HWn68YGLEoKPWkqikNXxrOphnJGFiiCgNJ2AnXl8Rula+4k0uHCGDwA2@lists.infradead.org
X-Gm-Message-State: APuU4Z94E4ZzjSR/9dph6TaCpLP36ofE8wVqJpzRLB6t5M3UTp5fHL9P
	V9iGhHcRBU2xQTUiIC4i0PxPQ715GWxYMQlh06jKrloTocYmgLm0vjCB
X-Gm-Gg: AYBFou0ofeW6CXkZakvLQannML2jWpKRWikCOxLjzJzzupYyQmQjEr79hcf+hXm43j8
	wbWrlrSPCoXJFXjac4ZT5ufQ+gdNdPXUGYtUZkW2A1yxMCkarLdCZQXiXiOgAZFKvjCqiTS//BA
	EznIbb+zlpC7aa46R+U2oJ710j0FnmLh4ag1XjLaA49a1R0k5/SovzKZXIj+GNU2g+PixLUgHR7
	CQfgQ7tW2kTI6KXKqBFxh6IR2AiYBLk/THd6dzbrC530uO/QZEcDdXneK1WD+gIcMwMKBcALo87
	Ve+r7SfYweh8rfXiMLzOkfC/R/vqBLluDZabTT4qT85V+LzoaGEijnKO5CW4VMbGYBsIeyDJkAq
	eZDe25GIBGgYuie5Le5UnbusMDZ25nUf0nQwLgsHEfmyzVX4+50zkHZfcZn1x8Lyn/6vWwPAesd
	722QS3rxBEt40OxqYzqHdb9ecruri84abqqpoU9iec6KVjpRCvkqgGoSRxfi9CEQusznzBQOKWA
	cG8Ymb0CvB6GmrJI5sND23rZ5cX3niR3/qRRu7k4NEw1EsEBX9UnA7B0dZBpnDSioctwc758/H/
	2cr/m7WFQkw5HqcHQ/F9dYJWdni5
X-Received: by 2002:a05:6a00:4211:b0:87c:e44e:5694 with SMTP id d2e1a72fcca58-8b37ae9cca3mr1380301b3a.21.1793945127925;
        Thu, 05 Nov 2026 22:05:27 -0800 (PST)
Received: from macbookair ([150.203.68.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597f0161sm306194b3a.26.2026.11.05.22.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:05:26 -0800 (PST)
Date: Fri, 6 Nov 2026 17:05:19 +1100
From: Myria Sarvay <myrialsarvay@gmail.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	sven@kernel.org, j@jannau.net, neal@gompa.dev,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH v2 1/2] Bluetooth: btbcm: raise ACL priority on Apple
 Broadcom controllers
Message-ID: <au1uH6uxtsw2vHfP@macbookair>
References: <20261105085750.120392-1-dev@deq.rocks>
 <20261105085750.120392-2-dev@deq.rocks>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105085750.120392-2-dev@deq.rocks>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_220529_635186_BA40D078 
X-CRM114-Status: GOOD (  15.87  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 09:57:49AM +0100, Andre Eikmeyer wrote:
> On the MacBookPro15,1 (BCM4364B0 over UART) A2DP audio drops out as
> soon as WLAN runs on 2.4 GHz with traffic. The host keeps the eight ACL
> buffers of the controller filled, but the controller holds single ACL
> packets for 160-200 ms, so the sink runs dry.
> 
> Sending the Broadcom vendor command 0xfc57 (HCI_BRCM_SET_ACL_PRIORITY,
> handle and priority, as used by the Android Broadcom vendor library) with
> priority high for the audio link stops the dropouts. Setting it back to
> normal brings them back right away. The BCM4377 of the MacBookAir9,1
> accepts the command as well.
> 
> Raise the priority for every BR/EDR ACL link once its Connection Complete
> event arrives. This covers audio as well as HID links. hci_bcm does this
> on Apple machines only, hci_bcm4377 always, since it only runs on Apple
> machines. The PCIe driver receives events in hard interrupt context, so
> the command is queued from a work item.
Hi Andre,

Just wanted to point it out, if you hadn't seen it before, that Sasha
has in the past sent a different patch [1] to run these priority
commands. They seem to take a different approach to when to enable/run
them. Wasn't sure if one was better or worse though.

Thanks,
Myria

[1]: https://lore.kernel.org/asahi/20260525-brcm-prio-v3-1-6259e10233f8@chaosmail.tech/

