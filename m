Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFAECD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 10:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJoMClM82QzX+aGWXXRpJH1kO6RtFIoJ4NC0MWGce34=; b=hu/mGhMeqGrRMG8NN2y6VW8pyE
	1QupVTb8RHpeA/dVDJOJ9CaXhw3Lst0d4thmRBEDdpB91aeFFQHt/TotydaquWWJz8AZ/zD5DsKPI
	j/+90YQWkq5R9rnF43EpTAul/pVti4BF09PhWSxVUmJegEwrFo4Tir1dbFMsrml6XpQ44tsUKoiV0
	afHxYDoKhVySbtBAMfI20T2125MqE74vY7Bqc3603osutGtmOvqXvgsaMUH8it1BpoQQvCAzO5a4E
	Xwf3hjKOzeEdivQJoy5koDQA4kKiDpg8GOlECgAoB9eWK0T2MF9OHXKrMTwedwA7Mj4L2BTifwvT1
	+1AJBaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKwHs-00000003XUV-2obP;
	Thu, 07 May 2026 10:49:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKwHq-00000003XTv-3j07
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 07 May 2026 10:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OJoMClM82QzX+aGWXXRpJH1kO6RtFIoJ4NC0MWGce34=; b=OE1RXXtGNaTHalCqszKQCf2nHR
	zamiuXCe+E6StHO2UrLZQj6UtAgey9mtcvbCYeLtIkN7Kpyv0aDSb2eGQSuGXd16y4aTzQewZH4Sx
	WqpHiPwg6H2hv35FDDnIuArF+1ZToEoJ50hFjKRFzGdQrZOX9KVIiNYioxBp55cJp+oVXHQ/a8WVK
	7Cpfj8haOi/4MW6+fb6tQ7ZT19EZiOfp/JxxB1J3nOpf+0R/1zejSMi2E5FHOPnU1pljddo4TwI/a
	XCCHPqN2H4s/JFlfMa+717mUKfWtCcIRGTvHkFpI+aYB/zONaR8alvyIbBKvooXMR+owKSgfYzYWP
	KjyWzvFA==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKwHn-00000003FxG-3kJl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 10:48:57 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so72185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 03:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778150933; x=1778755733; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OJoMClM82QzX+aGWXXRpJH1kO6RtFIoJ4NC0MWGce34=;
        b=mRZvsbzORfLIyQQhOBxKAHOCOiPKtsEAMnrRtcxoWel1uZPpgwS3ZJH4cD34ZgBCOR
         a4dSCWei4ihywvdE7X9ODptfiFPlTfwJRxF/LCDLG7coq5HvT5oBSuRkUiBMfHgp8ZlD
         gOQ+wpIqqcDBgEPP+TvqkCFORtBHM5F8z3mE4OT0cYwR17qQn2ZOxCGUnjPItFxi6js1
         ZZ+lMlLN8h7maXpveOHvwKDnGn9AHMBE/qAWYmUdEPR5EOHUfES1Rgar0yK9t5fYKWV1
         zXn/mzOF/ouS5+MSNPmh71jzVHY6L5KitmV6zactZywuicCQSB6kCE2OY2ZYzwVpf8D8
         2p7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778150933; x=1778755733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJoMClM82QzX+aGWXXRpJH1kO6RtFIoJ4NC0MWGce34=;
        b=hX5ljm11N6HG8yRTurNfV8csgimceyG4CUgAtylUsIq+frBnugx8yUC75IsPHr7BcY
         TMI9R4DKggxnF0OXZX43gAPKUk1kVO5aeXtWPzXy2JWwkVqNh+9hUdMZUekHg6o/gZ2Q
         8hHfD7FUzXVZCvRSuN/QiWmJwGsOnNRgE1OduQFiBT018l6QaDh9JVRZomyQLpzKVNaX
         ymm77GVamCU3E5rlv0UlsrWruFCJ6gZ7iOWEjV08SGDhfRNOsVcFd1rOwzixKOLKueA2
         6xq4mH4kYv0bSNZOFFl/D2EmuZPjr6f3O2PDJr8ylgT+VA8rAfOPu5oymgempEtIAswI
         U7Yw==
X-Forwarded-Encrypted: i=1; AFNElJ84DDeZIp2SAgGuhzgowieUtNNRVM9I7fY+Tq0Obl/+pTlE5cbeYgdhw++ZA49HZytxKFVFR9TpIn+6W8UzjbO+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7Uu01NqICl+/QtXzYE7S/K/qh9qZ02ywx/fxHqR/2Wbt7j5qU
	MQtWtg1yI6INVf9T+gYoeuI7BggKUjdQQ5/wWs5gf41Pk1+akmCPKr79BHOmM5qAqA==
X-Gm-Gg: AeBDietoz6MgrQXTGb5WQovc+UTDRJ4W4ieOrdE8M6o4+uVPDEAcDkE3EMkLBqYtI2e
	qxVwDkYsb5bY25lSBxLyOUXwyBQSo+8rY0HbGvnRy/4H+umqN3Ln70XQWSKorAJdM77SKWGOhfR
	pWfnBZn3OcWxTVJvaq3Gi1NmBkeRxp/dl+JcHdGE6SgbbAvalJelf4i0R80bBK8lTThBwpAmJ/T
	PIJzncysqtjHcb+JtB9OOje28UkOKYBWoji3uO/BwzYfB4bwHHXFrO5fs9GOXTB2UYqYRxS++f2
	wSgXK9re1NY1pTlq1svmxViR5QiWN6osst8x7AKeAGBxpUI9UAbjJq0xJKEfhl7hm5EzkGaTkn5
	gGfcDy5h3qMVgVXAa8wt7xopYHiKit9gmiwIPXRYV29ek5AXHGeMh+XMQLC66mOf7LuIceKwTuM
	pu7v1ywQIToO9yHJYYhyGMbqkVCdI3P6wJ/ieKDDiPbT5J5AJtr5HvHgdScLPhFluQX6kVXCklH
	TvmIVIupo64eYNf6OU=
X-Received: by 2002:a05:600c:48a1:b0:48a:5d55:c194 with SMTP id 5b1f17b1804b1-48e52ef8beemr1106625e9.7.1778150933019;
        Thu, 07 May 2026 03:48:53 -0700 (PDT)
Received: from google.com (117.15.199.104.bc.googleusercontent.com. [104.199.15.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02802sm19772180f8f.17.2026.05.07.03.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:48:52 -0700 (PDT)
Date: Thu, 7 May 2026 10:48:46 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com, oupton@kernel.org, will@kernel.org,
	joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com, Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Forward FFA_NOTIFICATION* calls to TrustZone
Message-ID: <afxuDpecPCVA56cL@google.com>
References: <20260501114447.2389222-2-sebastianene@google.com>
 <86wlxgy00t.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86wlxgy00t.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_114856_282649_D020E124 
X-CRM114-Status: GOOD (  32.73  )
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

On Wed, May 06, 2026 at 05:29:22PM +0100, Marc Zyngier wrote:

Hello Marc,

> [+ Sudeep]
> 
> On Fri, 01 May 2026 12:44:48 +0100,
> Sebastian Ene <sebastianene@google.com> wrote:
> > 
> > Remove the FFA_NOTIFICATION* calls from the blocklist used by the pKVM
> > FF-A proxy. This restriction was preventing the use of asynchronous
> > signaling mechanisms defined by the Arm FF-A specification to
> > communicate with the secure services.
> > While these calls are markes as optional, there is no reason why the
> > hypervisor proxy would block them because:
> > 
> > 1. Host is the Sole Non-Secure Endpoint: The Host operates as the
> >    only Non-Secure VM ID (VM ID 0) recognized by the Secure World.
> 
> Where is this enforced?
> 

There is no enforcement in place in the hypervisor since we don't proxy
FF-A from guest VMs, there is only one non-secure user of this which is the host.

> >    Because all forwarded notifications are inherently attributed to
> >    the Host by the SPMC, there is no risk of VM ID spoofing
> >    originating from the Normal World.
> 
> I don't understand: either the host is always using VM ID 0, and we
> have ways to check and enforce this (how?), or the simple fact that
> the request comes from NS is a guarantee that the SPMC will treat the
> VM ID as 0.
> 
> Which one is it?

My understanding is that when the hypervisor doesn't handle the allocation of
the non-secure IDs (through FFA_ID_GET), everything that comes from non-secure
is treated as having the VM ID 0 by the SPMC.

Thanks for having a look,
Sebastian 

> 
> > 
> > 2. No Memory Pointers or Addresses: The FFA_NOTIFICATION_* ABIs
> >    operate strictly via register-based parameters, passing only
> >    VM IDs, VCPU IDs, flags, and bitmaps. Because these calls do
> >    not contain memory addresses, offsets, or pointers, forwarding
> >    them doesn't pose a risk of memory-based confused deputy attack
> >    (e.g., tricking the SPMC into overwriting protected memory).
> >
> > While the pKVM proxy behaves as a relayer, it doesn't currently have its
> > own FF-A ID(only the host has the ID 0). The behavior of the setup
> > flow is covered by the spec in the: '10.9 Notification support without
> > a Hypervisor'.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 8 --------
> >  1 file changed, 8 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index 1af722771178..a82d0cd22a17 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -675,14 +675,6 @@ static bool ffa_call_supported(u64 func_id)
> >  	case FFA_RXTX_MAP:
> >  	case FFA_MEM_DONATE:
> >  	case FFA_MEM_RETRIEVE_REQ:
> > -       /* Optional notification interfaces added in FF-A 1.1 */
> > -	case FFA_NOTIFICATION_BITMAP_CREATE:
> > -	case FFA_NOTIFICATION_BITMAP_DESTROY:
> > -	case FFA_NOTIFICATION_BIND:
> > -	case FFA_NOTIFICATION_UNBIND:
> > -	case FFA_NOTIFICATION_SET:
> > -	case FFA_NOTIFICATION_GET:
> > -	case FFA_NOTIFICATION_INFO_GET:
> >  	/* Optional interfaces added in FF-A 1.2 */
> >  	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
> >  	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
> 
> Shouldn't these be sanitised in a way? A bunch of registers are SBZ in
> the spec, and I'd expect this to be enforced.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

