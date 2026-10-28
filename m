Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09553606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 18:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iGnCIfaj;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WsZylVEw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YCIM+YQFrajHkl7Ol4fId4ZkAJB6I0ksGBZA0GnY5pM=; b=iGnCIfajUxWDwv
	QJU3UbBpLQON0jNJFJWDylqpSmdtKooTqRiYvrlIa7LIpr3UqY7vF0rNRk/e0rIIkSTHwAaITZk/P
	cDo0ATb2pBX+f3pzmENoBiAJO5iAHOwzMdYyeAWSf8u2vLOnVlPP2ldp22XHYF5TJFXqMqAxgi9Hv
	rpFZ9TQ37yyN9GwJvlHsMFht2IS9y3+MnTkMvN7qTlR8E9N2gacDz8GzUWdqCcuL0hWEZjKITyK3y
	AJEdjuKy/0Rr1z9r+bTV+QEr2gd7dI3mMunUwbJjAOI64NZdUFCF4BaM2pCtIsSZ8W5pLtJ/MhJdr
	bfs6RTCEhbINSA2otnjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM839-00000007izM-048k;
	Wed, 28 Oct 2026 18:06:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM835-00000007iya-2TEq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 18:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793210812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YCIM+YQFrajHkl7Ol4fId4ZkAJB6I0ksGBZA0GnY5pM=;
	b=WsZylVEwDbVZmx0lvz/0mJxB1wPzfcrYjGy6jCt765wBWSlUGwAfpp+9xTvY9rMlWUqrnN
	tWvE+9czaRHfyNTBTDyTf9Moj93wZ935QaOjP9zuUVnDsRFLr/HVrL4Qr5sDtmqdy14duc
	XbqC++jGdHeRQNtPPlrVeTrt1RgvKrY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614--0LuuGu6NVmcPopvUxzpLw-1; Wed, 28 Oct 2026 14:06:50 -0400
X-MC-Unique: -0LuuGu6NVmcPopvUxzpLw-1
X-Mimecast-MFC-AGG-ID: -0LuuGu6NVmcPopvUxzpLw_1793210810
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1895ffc83so9194855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 11:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793210809; x=1793815609;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCIM+YQFrajHkl7Ol4fId4ZkAJB6I0ksGBZA0GnY5pM=;
        b=w+oDc/SWRmEjhOvFCrBxR7KspU0f1WwFhFnyTejP3QgMjFFFrlFbWF/DEeIMGumRf/
         Ag52NnJanEfK9k57liHQLPaaG0xBVDSsBZkdlzX7qNPZMQQ6ENAy4t5BQacesT+0iqbY
         Vl7oskCNMSFt6v4zrA/XzXMenLtOnRegcnST85er/fiQ+6uNTHl2j6cN8Z+pa6sa6BFy
         yIN8iuBkioOAihW1F9C+k+0/+q15cbZvBpwQWtrwltcOkm42WXYwBZSqi8hRd1lS8ohG
         9dt+s/dFglVRgMlg/kV5qbP+hEg0ygErtNKRnGPnhFWZ61f3O/C/nyZRE9YezlYB65wO
         1W6g==
X-Forwarded-Encrypted: i=1; AKwUvBz6B42+LhT/NER/VWLrH5U0uNrlRtHHhZ8Zxtt9KMW0swpqTbZFzKv0TuNGPvG7Olqk+kHqaYIW1TAx00dxLTAE@lists.infradead.org
X-Gm-Message-State: AFq9FYKzi1/EsZg9REu/kScc5WhMs99zPnn57KzKzktFj6QdErbWPlzf
	LmRtBez/ptghPMVFpm6q7u+PSwNNeVj7eXzM9vFtGmjhqTk65j3kxmrMveeXtMNLrQuCpA3yZGu
	OqyA7Vsx2mSeJwETh5vKuTBxo5lTzo2968jLFMg9B253OgpUYdfCRlD7hvO6jox6XZVqR9Kvm6p
	6/apbI1NtwXHdUlpK+Pue8y9jPhyqjWB5Zb9IyuLPtwerLQwIaHOQ=
X-Gm-Gg: AYBFou2WpY4EK6Z4D6/ua8rB2cvVfwQ8tAuRuBhtPPXBpGz36M7qLVUZbOwbd7d+RFl
	jhLlVlH1telKOuV7saj6dzfFQkSbnZOqGHKENpPKzgDshFLV/zWIgayiNSxi9/OBTlg3Q2uJ5US
	ocmYTc6DaJqP02AFrMbxMVk47uwGWv2h7ZrL4ZDs2jjRzoyjMDSsznUz6ksRciLHU/rPf4uhL5D
	Siup5SwPVQaNAlrZQ/vFygJVE5lKnADtDzE7/MfTryrhWeqWQEBT7XiVRTp
X-Received: by 2002:a05:600c:4ece:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4a9674e69dcmr70364545e9.28.1793210809504;
        Wed, 28 Oct 2026 11:06:49 -0700 (PDT)
X-Received: by 2002:a05:600c:4ece:b0:4a1:6c0c:ab93 with SMTP id
 5b1f17b1804b1-4a9674e69dcmr70363965e9.28.1793210809079; Wed, 28 Oct 2026
 11:06:49 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027143424.2732449-1-maz@kernel.org>
In-Reply-To: <20261027143424.2732449-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 28 Oct 2026 19:06:36 +0100
X-Gm-Features: AclHuK9bNQt52dZaGcgL3nkbgBCrd6uMFuOFFsScp1NU61vx-ZKL1_doFNpPh7w
Message-ID: <CABgObfYonkEvFNzm=94UWCnH5h9Jv_FFfwOir5EAoaeW29eqwQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 7.4, take #1
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Mark Brown <broonie@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sascha Bischoff <sascha.bischoff@arm.com>, Sasha Levin <sashal@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: crjJDxPPZ83NfYQUtxu-FrfwAz1XJPojNkK-3ed4RCw_1793210810
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_110655_701740_C76B9121 
X-CRM114-Status: GOOD (  14.87  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 3:35=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> Paolo,
>
> Here's the first set of KVM/arm64 fixes for 7.4, most of which have
> been brewing for some time. Of note: a couple of fixes for mismerges
> in the initial kvmarm-7,4 pull request, fixes for the publication of
> IN/OUTSIDE_GUEST_MODE, and nesting for vcpu pausing. The rest is a
> bunch of cleanups for nonsensical configurations and some more pKVM
> fixes. I have already started queuing more fixes, so it is likely that
> I'll be back next week with a similar email.
>
> Note that this is on top of the initial pull-request that you sent to
> Linus, so hopefully conflict free.

Pulled, thanks.

Paolo


