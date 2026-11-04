Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34912606D80C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1zRjU0CN;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gaBmgHR4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ozSGf2zyuVYYLVzmKkiurYsLvvrqYzVSGZ8tHSkd2EU=; b=1zRjU0CNzZ+HIe9P0Mq0ukKwSL
	DwWmjYAbvaJqNj1gPrSryrxZV+CrD1XHJCEsm6/ejhhUvM4GWj23adLhdm720tTPh/wXFdsm8q/Cv
	22PxLI5F6vi9fnrU1RKSI98biD3zB6mZQzMcMon3D9u/cBWxJCH1GzF9PZ6looarDXiuc6WFtNNmi
	idD59+k7d07YHReuMZFM+AHyJCX031vVAGGnH85xlKmnjcECj70BeimRoi5+WPmbJhmwKJQEFILke
	vVH/E8lLua6eZA3CInxlHXO3l50mYZX2GFwxMPBNFnkFqXI4M6RLCS4Iiaj+2eIbrSQOAx0haUDBr
	Im9HeRFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZIz-00000005BnL-3kFW;
	Wed, 04 Nov 2026 11:37:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZIy-00000005Bm7-0XZE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793792243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ozSGf2zyuVYYLVzmKkiurYsLvvrqYzVSGZ8tHSkd2EU=;
	b=gaBmgHR4BR5KhzzjedYykjxmp5nDN7co/1bCU/XsQdNXpGylT5z6TuJdOJovX9JFETJ2hA
	7srHc3RDZnBORBpQSg8XIzy8aJqZW63WmXXxJifinADfNHVLH94TrCVBLltR5VfRi7U5fW
	2+PvGYQGc2LRBen0zkH+NWF9s30KFQ4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-UipyfhCcMsGySa4BJeZnQQ-1; Wed, 04 Nov 2026 06:37:22 -0500
X-MC-Unique: UipyfhCcMsGySa4BJeZnQQ-1
X-Mimecast-MFC-AGG-ID: UipyfhCcMsGySa4BJeZnQQ_1793792241
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-490ab0a20ebso121108f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 03:37:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792241; x=1794397041;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozSGf2zyuVYYLVzmKkiurYsLvvrqYzVSGZ8tHSkd2EU=;
        b=cc+fXwwbwgSkHktW7GbLSRsMFX5+j1vRr5/bTYzAXN1HzX20lWPMUX07oiCuHClXoR
         h3bcrfOcQtHNsd9+TvZGNKJA0OIj5Dsy78yzYoznIeuh9wYfRQNdCSgdYp9LVYbMaCp4
         HcdJHbGk7uChJOAltLdGPFz/fi8+PEt/65NHXprYqNRmYG2HKSHqOhZR8oJWlums0YI8
         PAnp1FMsGrEHbHVJ9i4P2lUkf/eLkvzKVwgWgQ0FsunFNBPdq7zRvaZ0kqta48I3viut
         RBa2HDOWV5q541ega68hJ5+fivTicEauX84FEhk/LTU5KJRwdorjj3n3qp6Fge2i1Ik6
         adqA==
X-Forwarded-Encrypted: i=1; AKwUvBwH4huqP1utvQYHSe/O87hWJ7Yxw26dpxxNsjVSpbU47oRh1hLYCT3CqyHhf7ec+tlxE5XgHGdH/9DD4KsNcd4k@lists.infradead.org
X-Gm-Message-State: APuU4Z/15rprL/6QGE5l0jwud2ByddBzM/x6sVLIrgr7WLGYZUryggYd
	bddNP9xeFzSMoiS6lhd17OftSupfW2bottPId056vt3JZeiyz5hK0ibeD2Q1WTuGfGkqy3Qa8NR
	7Go9UJOzORBKhr8SLN8aI3Pa0dnv8Q7NJ8fZmItq2xiWk36ko5cMa7Qun72ep0mS4q30Y2BGCi/
	Ex
X-Gm-Gg: AYBFou0xS3Zzy4FbSG1ggbMvV4FFPLkMM5W2XW0rXztmfBeJEVoeGLGMzShQeIdTkZN
	yoaoexqRy+mYZPFanIp2BszmUSWzfu7MFIQGtPvBxTKcdG5+/bSHy1WLoyNARDCx62SAhpquf7s
	SS7xREsE2/u7VohJTNc4VaomUyYqJujnv1sDV328ux9/zhcUSacDSREiATgnTzxrC/+NwS4jez4
	Mw8sNvShUgUt6kYcsxJ+MKwdtuBKyj4e8j7+NjtXnLem2GKl3+IX+UnPq1++JiLWuWPvFeoMiVe
	vm25gTtHkHeCfuxpSD7lyjSvgVdH0zh9LCqxrxfHOkVf23KpRzkqEZ9poML6uy60RQA8dE/Bqy2
	GSqdIoVO/YT0xYQ/8PzduCpMLl8RKShaPIeJ4fZwC7taeTuAsbBSSaawwn7AyyQI/dtepB6vhw+
	Ur2wt7wdfQd2/sZDGTI5ufzBdoT4Oo4hgdF+ObJQ==
X-Received: by 2002:a05:6000:260b:b0:48c:4553:790b with SMTP id ffacd0b85a97d-48e6e50075cmr31750647f8f.48.1793792240851;
        Wed, 04 Nov 2026 03:37:20 -0800 (PST)
X-Received: by 2002:a05:6000:260b:b0:48c:4553:790b with SMTP id ffacd0b85a97d-48e6e50075cmr31750621f8f.48.1793792240514;
        Wed, 04 Nov 2026 03:37:20 -0800 (PST)
Received: from seott-rh (p200300f6af1574019b2c5947d8ec139e.dip0.t-ipconnect.de. [2003:f6:af15:7401:9b2c:5947:d8ec:139e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99d67sm3430641f8f.24.2026.11.04.03.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:37:20 -0800 (PST)
Date: Wed, 4 Nov 2026 12:37:19 +0100 (CET)
From: Sebastian Ott <seott@redhat.com>
To: Mark Brown <broonie@kernel.org>
cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
    Oliver Upton <oupton@kernel.org>, Ben Horgan <ben.horgan@arm.com>, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
    linux-kernel@vger.kernel.org, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v9 0/3] KVM: selftests: arm64: Improve diagnostics from
 set_id_regs
In-Reply-To: <20261103-kvm-arm64-set-id-regs-aarch64-v9-0-ab32bc79fa9c@kernel.org>
Message-ID: <7db30970-dc9c-702a-2f1a-f52c2e253494@redhat.com>
References: <20261103-kvm-arm64-set-id-regs-aarch64-v9-0-ab32bc79fa9c@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uEwsJp5g4fzROQZthRezxQOIsu8XXsG1zAmp5KJMdX0_1793792241
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_033724_251201_42A17B99 
X-CRM114-Status: GOOD (  10.07  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 3 Nov 2026, Mark Brown wrote:
> While debugging issues related to aarch64 only systems I ran into
> speedbumps due to the lack of detail in the results reported when the
> guest register read and reset value preservation tests were run, they
> generated an immediately fatal assert without indicating which register
> was being tested. Update these tests to non-fatally report a standard
> kselftest result per register, making it much easier to see what the
> problem being reported is.
>
> A similar issue exists with the validation of the individual bitfields
> in registers due to the use of immediately fatal asserts. Update those
> asserts to be standard kselftest reports.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

For the series:
Reviewed-by: Sebastian Ott <sebott@redhat.com>


