Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A2A606EE8D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vz4BJixU;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hkJd/cGT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ntbAVzKKszvhnnecyjPK9p4OIP/hmO9ZcKNX919vInk=; b=Vz4BJixUv7YPLl
	SrTZnSwPuLowG1x/6ypt3UJXX0RkOWZtvOvfaLCkoqJ8lTlP0iF86gBJ2JQdzvBBl5rW0NkhJJWMi
	z4yUcgFkzevTI+j+lAv2aKDcOn2ScLKbAJrh/s9KUWFc7aEa1+i1VyuigaSzGGQ+tT2MM/qVVlWHa
	/h0gHx499RCUTUyjoLUHtH2LRo2SgD3iFh8pq9x11JWDCtPWN/gNcUjSofSap2IjBdeFUnEqWlRUC
	GS4ehKoGEPvXb9iLp3kOKmlf+ik8Gf9LXFebqBXZOcZ9igM7OJRopFI4lWAtn+LbeYGZZ4vTm/k3u
	GEpqUVbro60N+jx6bN1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOu8B-00000008Mar-2Fng;
	Thu, 05 Nov 2026 09:51:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOu87-00000008MaB-2es9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793872294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ntbAVzKKszvhnnecyjPK9p4OIP/hmO9ZcKNX919vInk=;
	b=hkJd/cGTXQf8gONRmfwGMkSqjAveIZ2oxKo788DmB8g8svaAgniC90naYOBMKiCvn1B6Mx
	raORHnBkVLr43IxM4qE0lmHX2twwUd1EAqEkjUXAnyOSMmN26WdNdZkl9g67PDisED2uJQ
	2HAvQLOv/S2WIdx9mE4acaLPG2JbjSE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-HxNX0loKNO6Id6iglsNAhw-1; Thu, 05 Nov 2026 04:51:33 -0500
X-MC-Unique: HxNX0loKNO6Id6iglsNAhw-1
X-Mimecast-MFC-AGG-ID: HxNX0loKNO6Id6iglsNAhw_1793872292
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4903fc8537aso1063755f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 01:51:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872292; x=1794477092;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntbAVzKKszvhnnecyjPK9p4OIP/hmO9ZcKNX919vInk=;
        b=L1p9g0RNRifqqD6hPmTD6D1x/P/J98zDx6bmnUNLJ50Tdd52gXVj2i6gnZ7yN0pR0Y
         MALYWUXgfK6bOROaJfVa75Cy0SUWex/ANbz8MHA5jbmKZIBpRD6FZWdbyXSqflmQqt1x
         4+fPbiq5ICr3SdgBDT3cnsalUdJQQbo5SuDrffbvUxLhDmzs6/kEl21xUqYn10OVBcNq
         L2T0yB1p8ybiMOQPMZ6wgfFxm1YKOSzrbpO+ZqPasOWmQ4gS7X59IoxbDHrqeObC6i4N
         zocCXWi7zTV95HLwSACtd8kxZxgU0eXIu77+VdFbf+qp/BJJCKW3jOYTtdKvhsSUZjiM
         0Oyg==
X-Forwarded-Encrypted: i=1; AKwUvBycPPP5zOfJxomJGkbh8F+vIyVBUYJtpAtUudVit1Uoq39ERiiXeHPkwpnsvpL7w5hmNJrjBtYfP8vNnaJlz69F@lists.infradead.org
X-Gm-Message-State: APuU4Z8LF+TNz+WOE2QVXW9Stx1EMYSl67DXVgi1j+nvVNUZYylo+gKy
	OKy+UmMpiRcqP5XfAt1cfUFQSTA4dMLg7ACw7w2gjpTNtvvekM5xgnaXI54u5+9WrpIBeBrNOl5
	JbPrD0I9fPBxh6Q6teSDlSsupoRwHF84PuZqL2dsArwFdBL+xq5fAVp/x3TaAnnSlavPQ5IAb7C
	Wg
X-Gm-Gg: AYBFou0zpuNJgivvxrA8i7SX4doubVvPZ4N5U+zHYyfUxP19iMjgGrdVW2oecemyqYS
	AGHYExH+y6OaSDVLXqnfgL+D2+ope2S/oNye2puxEpzsIWElqqWLY7LUNoV16wt3Mbu0ZnXQodb
	GXPlQ4Huqxd4NPULMrVHQyEaHwLjgHyI5Mybb+WC0zGO1P7rTEvVqbS5B9TFf3gX0I0YMYhzwlN
	0J1z7+hDkjiSN6KlMPrbo1UQBFsYNMYc7NdPDt3Zzt6kPa+4YqDfhkQBtn30LAdgvRv/urT8y3a
	wUJVIt9ZjqyuIn2KC1OnlnQblOIRDUG9kd834gc+LR44vnOO6T7jgt5bSAytcqUAdjNfvmY+HuI
	l+mtffqvEi7WXwOPPG/wMx40I0tb2TA8rd2men2B4vxWlvtbQYduZHOH+0MDmZWbo3i9ECMF15W
	vzN2Ye9efdqiFghNifHPdmGM9EHzVc973ho8X1ESllhLw=
X-Received: by 2002:a05:6000:430d:b0:490:da85:7aee with SMTP id ffacd0b85a97d-490da857cbemr5409712f8f.24.1793872292007;
        Thu, 05 Nov 2026 01:51:32 -0800 (PST)
X-Received: by 2002:a05:6000:430d:b0:490:da85:7aee with SMTP id ffacd0b85a97d-490da857cbemr5409669f8f.24.1793872291556;
        Thu, 05 Nov 2026 01:51:31 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea1811c4sm8980486f8f.3.2026.11.05.01.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:51:31 -0800 (PST)
Message-ID: <6810d4c3-a3b9-4da5-97fe-27cfd92563c1@redhat.com>
Date: Thu, 5 Nov 2026 10:51:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/5] net: sparx5: add tc matchall port policer
 offload
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, UNGLinuxDriver@microchip.com,
 robert.marko@sartura.hr, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261102-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v2-0-3bd47ec1b227@microchip.com>
 <679b8dcf-0aac-4674-a006-5af0156a82ae@redhat.com>
 <20261105093905.ln6tdot26wyej7pi@DEN-DL-M70577>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261105093905.ln6tdot26wyej7pi@DEN-DL-M70577>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C5II_cHntmPazD966MmKqObpbR7aqomSfefNUhpLcTs_1793872292
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_015135_763188_E182AFC9 
X-CRM114-Status: GOOD (  15.91  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/26 10:39, Daniel Machon wrote:
>>> This series adds offload of tc matchall filters with a police action to
>>> the ingress port policers of Sparx5 and lan969x, which are both served
>>> by the sparx5 driver.
>>>
>>> In hardware, each ingress port has four single-rate leaky bucket
>>> policers. A policer drops the frames that exceed its rate and burst.
>>> The four policers of a port share the pass and drop statistics counters
>>> of the port.
>>>
>>> The driver uses one policer per port, because with more than one, the
>>> statistics reported to tc could not be attributed to the right policer.
>>> This matches lan966x and ocelot. The policer meters each frame without
>>> preamble and inter-frame gap, so the configured rate is a data rate, as
>>> tc police expects and as on lan966x and ocelot.
>>>
>>> Since the policer meters all ingress frames on the port, only filters on
>>> chain 0 with protocol all are offloaded, and filters on shared blocks
>>> are rejected. A police action that is already offloaded as a port
>>> policer on another port is rejected too, since in software it is a
>>> single bucket for all of its users. Only drop is supported as the exceed
>>> action, and the police overhead parameter is not supported.
>>>
>>> Patch #1 drops a redundant prefix from the existing POL_UPD_INT_CFG
>>> register macros.
>>>
>>> Patch #2 adds the registers used by the port policer.
>>>
>>> Patch #3 tracks whether the ingress block of a port is shared, and adds
>>> the per-port policer state.
>>>
>>> Patch #4 adds the hardware programming of the port policer.
>>>
>>> Patch #5 adds the tc matchall offload.
>>>
>>> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
>> I understand the following will be very frustrating, but for unknown
>> reason AI review did not kick on this series.
> 
> Yes, I noticed that. I thought you maybe had some magic button you could push,
> in order to trigger the review manually.

Unfortunately, I personally don't have it. AI review is sponsored by meta,
only Jakub has direct access to that piece of the infra, and he is AFK for a bit.

>> The changes looks sane to me, and addressing points raised on v1, but
>> I think nowadays we need an explicit AI feedback.
> 
> Ack. I think the missing sashiko-nipa check is not isolated to this patchset
> alone. Just FYI.
Indeed I hit more patches/series without AI review. In some cases I can run
the model locally (for single patch, due to many constraints).

Thanks,

Paolo


