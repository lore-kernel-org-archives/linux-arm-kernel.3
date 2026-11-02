Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0B7606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 22:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H1tlBMI9;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XZ7qjQgR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WDxQB3eUyT4fTAdQ/UkaMEE2e+sF8BTRfd+4MsQN6R8=; b=H1tlBMI9pjYYOG
	u5+YfmRN4d/i+jMC6ryvxPQw6pffGxEvQr0dEAV/yzoabqIuNFLprKgFgrdq8Holk2h1Ox3g+pqux
	fgAyV8WW3IyIpH50PRXbfDz77qMpc2J/UVgvqzBe1eWwDjSlF10O2I0VvTPu0Qwh4Mjj3dOQEWx9i
	G+WQi7FAFLKztz1UtI1u62097cSwUx2ezGlUsj9UHY7HMK0rY2zHMCHMx9MSL9zD9VLvDiymwrCUF
	I6VRQ7zQzwJokGezdTcxgGMZdo0eXykZFJQ3C9lf2vidVp/cW7gPla6Lr/PMpkM3NoeoCokyaacAc
	/7g8tHdjmm/0qNF9CZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO0YQ-00000000ZLN-3H2Z;
	Mon, 02 Nov 2026 22:31:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO0YN-00000000ZKo-08IN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 22:31:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793658656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WDxQB3eUyT4fTAdQ/UkaMEE2e+sF8BTRfd+4MsQN6R8=;
	b=XZ7qjQgR+YtABKmJElK2WXapS7KLh2remPhcjXzqTPgMzEVuo5F6MrCmldzcBKmi/Jr/J8
	gL0h5/y7OxnIHgSojy0ABwOHRtp0JybI8DFBnQgWxKqfA/VidNcxg+E6MS5r09NMKmOD1U
	SruV+pDSjTvq+SpEY0m72LFfbKq6J6c=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-4ekwONkWMvSASnCftruTHg-1; Mon, 02 Nov 2026 17:30:55 -0500
X-MC-Unique: 4ekwONkWMvSASnCftruTHg-1
X-Mimecast-MFC-AGG-ID: 4ekwONkWMvSASnCftruTHg_1793658654
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e601800e58so55917055ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 14:30:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793658654; x=1794263454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WDxQB3eUyT4fTAdQ/UkaMEE2e+sF8BTRfd+4MsQN6R8=;
        b=hTVKeWowny0sD7MyUmJDoJYrgI2eklhUITa96SMm2E+bcLaTLDPL1tEDr7V6ry1iAs
         N/C/RdPwIzsA+TB5DBVR1yDJ7bTiyRNMXeehAFV3Uza1PydMPprQZ3l9OsOJSfOHsAWU
         YnIaBJ/Zh1yDLgiRiyNEpRMyoK2fKq9yULN837yxzjqpsIpb0WRd1CKUqVFigw1QvN2Y
         7CZBTRbZ8xCQY9aTn0kRp4HP4AkQY/o5nbfw4QsEpAz2KqzRdQUZBnQ4pUq771JE7w2+
         cHHsDTjsLYspakEPDpZzA3J92QlzofxQVuuFkJRaxUjhDxfUiRvT/wEPT3WxT5lVLVxY
         MqyA==
X-Forwarded-Encrypted: i=1; AKwUvBw6u3SM5JZAD6o0oS0QMq+WEhmxlVe20CpmC7Npd7rOk3gg5jYtkqaahHZF4Rit69yvuw+rT9saSWlfwJTo7kGM@lists.infradead.org
X-Gm-Message-State: APuU4Z+UOfyMBHYmBsTkueaUVHZ5bfFsGJoThpDtWmU6bTW0LKy8lWNd
	ZDr95tvPoIUtITonIrFVNQi3DzCiv8ac0bc0zhVkaniJWiOJ16v0El0JQLT29xpfgNmdRPf8rK5
	tcR/biJmCGaT4mOLghGCpb8x331qdtAYQGpmnCdk8xnyCufzgjxR23jk/acU5zBJW37owtTMZwr
	rz
X-Gm-Gg: AYBFou2P/EMKviAOSSMRfgUFY52ChudasoePkEZ3vKzWx1UuJYmZ93kSXRxqJnXQ96/
	YWDM2Fe7QPdRQ+YlqkkVSQczZzFCf6LygYZ18VJSBJqqbaCLi+2INuBjhFtrMgIRBMAGJ6F3kut
	D4S2ecmuBFCGdQg99RDKaQ9TseLs17XjIPaBbjb8usX01qnDMoFcz4ZiaJmGcn/oOik9fRz4Exw
	/DVllWiI23fV6xICikWbUx+1nSdpS5mXPuRNz9lHoWxHxDVNT02r4cjOnPhgdHdk83t59Vcjej6
	x9h9tCLRnikE43+xLaymaxZ1U8rad2WGFpBbs4Zt8mRsNL4abCTfJmEGEiqbEYiLjRGaI/NBoYM
	ZR0m5vKb7/zAcvP8m41jSxkSvQQrNjh1SdH8tzFHEV6qFmczrBSlANX2Ljd6Hfxc21nMEdoHkZJ
	zPnFTd946pCnFPzg==
X-Received: by 2002:a17:902:d2d0:b0:2e9:5714:6082 with SMTP id d9443c01a7336-2eb3652031emr108465545ad.55.1793658654160;
        Mon, 02 Nov 2026 14:30:54 -0800 (PST)
X-Received: by 2002:a17:902:d2d0:b0:2e9:5714:6082 with SMTP id d9443c01a7336-2eb3652031emr108465375ad.55.1793658653732;
        Mon, 02 Nov 2026 14:30:53 -0800 (PST)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm33297415ad.73.2026.11.02.14.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 14:30:51 -0800 (PST)
Message-ID: <5ea2dfe0-7d95-4ab6-a17e-33e3aaac38d6@redhat.com>
Date: Tue, 3 Nov 2026 08:30:46 +1000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: avoid hour-long timeout on invalid ACPI table
 entry
To: Andre Przywara <andre.przywara@arm.com>, James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261102112748.3458012-1-andre.przywara@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261102112748.3458012-1-andre.przywara@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 88j9Qie26JWnZlFC8tOYdTaDd_9ZTxrAFkeQ1drWCbc_1793658654
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_143059_169723_0D35ED8B 
X-CRM114-Status: GOOD (  16.21  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/2/26 9:27 PM, Andre Przywara wrote:
> The ACPI PCCT table contains a "nominal latency" field for the expected
> maximum time it takes to handle a command in the PCC mailbox.
> The generic ACPI code reads this value, but leaves the handling to the
> protocol users.
> 
> For MPAM-Fb based MSC signalling, we use a value derived from that number
> as the mailbox timeout. However if the ACPI table leaves this entry at 0,
> the mailbox timeout code interprets this as "forever", and waits for one
> hour.
> 
> Avoid that lengthy timeout and just add one microsecond to the read value,
> to come up with a non-zero result in any case.
> 
> Found by Sashiko.
> 
> Fixes: cb351e3f304b ("arm_mpam: detect and enable MPAM-Fb PCC support")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Gavin Shan <gshan@redhat.com>


