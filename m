Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB062C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 02:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmJMEJ8CBKKO2kYbDPf0j/vMdEOUiylooeiw9fBRZ6k=; b=kzXofo1cJ/UlNvt8By4LFff/x/
	Hll4rusybmNx0sdrNoAii6xFkeH+i5OSVzJYGERlz7jhNxfacpQ04ZBiTy6CBxYht01w6lNjnleOA
	6/a8Saakc98wtzWR20DU3rabYPbbZ13zyrPF1JIn97duZWsDc8mxPJDhpS6MLgVXNw5ZNtDHBJRde
	STClprej4C+38ohz4ogjVy0c/RqEuSacmXZYfoTRJw5SWVlhUJgRIdN+Q7bxvANAwb6al2uWfVGvK
	Mbm3MMrElvcXh0670b+RWC/QqaltrnKnBpGcdWFehyV3ay6mH5WIjAKSAJKsA8vg0/+xvBuyg6URM
	45QTNQwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucxWZ-0000000DlK1-3Lxi;
	Sat, 19 Jul 2025 02:42:07 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucxRy-0000000Dl3b-2E72
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 02:37:23 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-234f17910d8so24699565ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 19:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752892642; x=1753497442; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mmJMEJ8CBKKO2kYbDPf0j/vMdEOUiylooeiw9fBRZ6k=;
        b=Jn61HmEURSV/Ad9GfqjyEI8jswVCxFeeD9EhtlM8blCpFwuRgoITDafVYwqgjL2/wR
         uIG7cAAxyMmKhpqFcWg6YoodWPGl7tdhzw7UFDdxMe9H+wxu8gSuZnTR7psAGfh3O0ct
         MbM+MARKbu4M0YE4HnsyEEWcNRAS8B4PKacl4mxN3HJx8aruAiyRuKeUYzxAzYv4NH+A
         wmaD/+i9RpXtAvtAVdF9MT/OzuLsHUt9oTA2dliEB024JSodGLjR+6t2HGoblwLlhB0B
         UtYTa/NoPZTbqbuik+8prajuGA0ftXw45hlyK9juCWUxIz1O2y7SRzLiu7dCQyVfHh6S
         cfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752892642; x=1753497442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmJMEJ8CBKKO2kYbDPf0j/vMdEOUiylooeiw9fBRZ6k=;
        b=VRecTpsWt+7UkM3+BwoHGohsCuoppAnUF2y5aazjQ0dp/qckaOYWkrJUeIvvVDFzt8
         2JPGyrRbhAwtdThNYzZ6OWnU5aSTYHvDSpAFZw/DJy+eaiz7tVTPuWE7lPx+c2JWKnvp
         oKK2+74Zaa7zHi+7nsfkcALhaCJ5Kt5kVLMy0t/sqnc79R79h5SL43QYwPd9oPFZx4Ze
         J+SmIGOlGkok8hpf+x7jPOtsn/Wyd4ORqVDutc0dksYHNPTUwVpShRJPH5Bxg4hUhORc
         gwEHJNgxaRBi6oem0OZ80Uwt91z7c6Ji3Iv1I7LHr5dVMn/gFxpgkDwsV3Qkc62cvm1i
         1JDg==
X-Forwarded-Encrypted: i=1; AJvYcCWZNy0ks+gyIF+7xs+VN3B/wXyL/uVSQ/Akq6O5ttODIvD6U4RC0saCeb9Q4/VNjrQl7HEb+L156oAVewhVx1xb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3fY18JzyLGkGnLrAtVqdPhBPi5G8OQtMqQ3TC/Z/R9OmI62cQ
	Vh5L+TiBxfwxuqAUXS/hzOnvb1zzGCKKv+5K+yzVoZ/jm4PHu3yZ+Cpn
X-Gm-Gg: ASbGncsz1mLL1PE0tJpCvcBLzJv1vAHyVwh3CxW/k823VEWVJIIO7F3RlaLlFyAkLNK
	Q0vvT5m72sXixzKxPEcKhhRtXuEj+wQlUc7H4LunvgWe5GPZxzNsl+jYKcaDQlSdzjU1VGEb00p
	jZV/DRdY/UVzduwKGXCWRFJLiYb09JaE/8pS4y+Eh32Fte/u1Ll3ltl884EizeBmW8awrRPWQNq
	0wzqjRSps9HvrVaaCrCap+tA9hxNyX6jZXjjM4JA7IiFgUXI6GZK88WX6qjhN27CiKU+XauVOWd
	O/toFM3LaGJHk3QddxtZgaM4eXhn/OjzYSCs8OMhPBFYawk4KhncKoRA9NqxYdYbpNZpzN8FYW+
	I5K/gs5mtHt8LmB+/fhahtZ8kBw==
X-Google-Smtp-Source: AGHT+IHs5pq3GcJWKuMtDUrc0Y5CYsi9XeqZUlq9pzhl8kPltEUbezNpqEVKb0km9n9B1drEwGrtoQ==
X-Received: by 2002:a17:903:b47:b0:23c:8f2d:5e23 with SMTP id d9443c01a7336-23e3b89a480mr76816525ad.52.1752892641661;
        Fri, 18 Jul 2025 19:37:21 -0700 (PDT)
Received: from localhost ([2409:891f:6a27:93c:d451:d825:eb30:1bcc])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23e3b5e2cbfsm20297065ad.9.2025.07.18.19.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 19:37:21 -0700 (PDT)
Date: Sat, 19 Jul 2025 10:37:12 +0800
From: Yao Yuan <yaoyuan0329os@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Yao Yuan <yaoyuan@linux.alibaba.com>, Keir Fraser <keirf@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Eric Auger <eric.auger@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 3/4] KVM: Implement barriers before accessing
 kvm->buses[] on SRCU read paths
Message-ID: <yr5vh2yn25fxa7xeja6gxix6nlqvx7jdwfuurwvf26523vnbiz@5ppp455mjuuc>
References: <20250716110737.2513665-1-keirf@google.com>
 <20250716110737.2513665-4-keirf@google.com>
 <ndwhwg4lmy22vnqy3yqnpdqj7o366crbrhgj5py5fm3g3l2ow3@5s24dzpkswa2>
 <aHpgLnfQjp3qdZOL@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHpgLnfQjp3qdZOL@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_193722_576022_123D901C 
X-CRM114-Status: GOOD (  21.04  )
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

On Fri, Jul 18, 2025 at 07:54:38AM -0700, Sean Christopherson wrote:
> On Thu, Jul 17, 2025, Yao Yuan wrote:
> > On Wed, Jul 16, 2025 at 11:07:36AM +0800, Keir Fraser wrote:
> > > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > > index 3bde4fb5c6aa..9132148fb467 100644
> > > --- a/include/linux/kvm_host.h
> > > +++ b/include/linux/kvm_host.h
> > > @@ -965,11 +965,15 @@ static inline bool kvm_dirty_log_manual_protect_and_init_set(struct kvm *kvm)
> > >  	return !!(kvm->manual_dirty_log_protect & KVM_DIRTY_LOG_INITIALLY_SET);
> > >  }
> > >
> > > +/*
> > > + * Get a bus reference under the update-side lock. No long-term SRCU reader
> > > + * references are permitted, to avoid stale reads vs concurrent IO
> > > + * registrations.
> > > + */
> > >  static inline struct kvm_io_bus *kvm_get_bus(struct kvm *kvm, enum kvm_bus idx)
> > >  {
> > > -	return srcu_dereference_check(kvm->buses[idx], &kvm->srcu,
> > > -				      lockdep_is_held(&kvm->slots_lock) ||
> > > -				      !refcount_read(&kvm->users_count));
> > > +	return rcu_dereference_protected(kvm->buses[idx],
> > > +					 lockdep_is_held(&kvm->slots_lock));
> >
> > I want to consult the true reason for using protected version here,
> > save unnecessary READ_ONCE() ?
>
> Avoiding the READ_ONCE() is a happy bonus.  The main goal is to help document
> and enforce that kvm_get_bus() can only be used if slots_lock is held.  Keeping
> this as srcu_dereference_check() would result in PROVE_RCU getting a false negative
> if the caller held kvm->srcu but not slots_lock.

Ah, I noticed the srcu_read_lock_held(ssp) in srcu_dereference_check() this time !

>
> From a documentation perspective, rcu_dereference_protected() (hopefully) helps
> highlight that there's something "special" about this helper, e.g. gives the reader
> a hint that they probably shouldn't be using kvm_get_bus().

Yes, I got it. Thanks for your nice explanation!

>

