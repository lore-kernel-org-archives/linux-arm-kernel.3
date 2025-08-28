Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2C1CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 12:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SyhzIZH3Q6IiBys3GR5p06vlDvFDBIcBe4gJFy0icy8=; b=oU9DYeJrSgvw4pcJnKNfFCNop1
	ZGw+jWH3aIZw6c/9bxk/bue+n+tP7WnTrS3uNXbEcaDxrjcvgTejmEcBOuqEZrLRBNvvUJKFiG7s5
	MTM3Y10XEyA/fPD2D8VIU3ohgxnLmRdCD85ThJnPvtdsiNYzJj8YY458sk2uGZWowZzdDL9lZcUOS
	AGwBdszolQ05piqrvMmzMIZ5d8Xy9/SbSbjSTfIpjPNWxC8o6uhQ1+Wmv1T4pmFC6qzhIAhlP38E5
	W29OEhGCFH86bK7ME1RL8n02QI3u0PWusfn5G4YvHPNDi82W/n8ptL8PzykuIuxRIyOMHmjSazjTD
	k4FjDqDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbtu-00000001aNP-0fRe;
	Thu, 28 Aug 2025 12:38:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ6Y-0000000105H-3JIm
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 Aug 2025 09:39:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SyhzIZH3Q6IiBys3GR5p06vlDvFDBIcBe4gJFy0icy8=; b=WK1C1jp5dkk9y5pgfMuFKrE6G1
	vQJrV+efNTIxC+2rJBzB8Tjf/XkYNH76Vi12WZ+Jm3dQI2fItCpyeMQtN7nEIKgOmE83NKnwBp2ia
	zIszka2AMT9wUEob69+gJmlyelO0uj/3eCShGK18XmTsoL2YNo48D84VOuopUc788JuKmLVjxXwXC
	nwOW1/a87GOLQsZjyiwPogQ2xOc2BYucn9CqxHN5EsjGYvAs6DoWDTi/4D9jpT5rtLiKKuQLeNe7Z
	0Bk2PRk51F7xCwir+8eCaYX/X7Vw9Zhaj63djcd2hVUXkI9rBtsXFDh4Ao3FX4MMBwqoOOBF9u/W4
	o7zWH8pQ==;
Received: from fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([63.176.194.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ6V-00000002gPo-39gc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1756373975; x=1787909975;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SyhzIZH3Q6IiBys3GR5p06vlDvFDBIcBe4gJFy0icy8=;
  b=fGqjvSFZ4ZA8PYU/UV4Ua4/CUSs8KlMqu+rEoveLkwh4C/xss5kJinz+
   VGim2YUW2YBkNwt7lwtKq3zgqnSo31RRbHPXG0Y8tjHWsVv+ydrsmgk94
   PX74s/qaJO1g7Vhmw9xHxRZtsbykIjAwPXrHBgKnBGT4YNoYFrymhg6/p
   asAH8vrFjcLjdKiy1aZEKRZvajS42FT/qBFPhzXlh6sEAjauxSYWjSd2o
   JR1ZlVlSYHzB75IQ+0lHnsogGQgz4ZE2/4QCyrex6dCQebsCAqUD5QZjC
   9y4uQrhyxgOFZXyOglVPAPgXmjWVp78jafn59Xh33HeoKLv1BkiMXTreD
   A==;
X-CSE-ConnectionGUID: XH6vX520Rw+VjO+/Iz6NOg==
X-CSE-MsgGUID: F0Zsr4f7Qnmj4E5zjIaQkQ==
X-IronPort-AV: E=Sophos;i="6.18,214,1751241600"; 
   d="scan'208";a="1301818"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:39:30 +0000
Received: from EX19MTAEUC002.ant.amazon.com [54.240.197.228:2694]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.11.1:2525] with esmtp (Farcaster)
 id 75f51d0c-0b42-4089-8026-da4960a5d2fe; Thu, 28 Aug 2025 09:39:30 +0000 (UTC)
X-Farcaster-Flow-ID: 75f51d0c-0b42-4089-8026-da4960a5d2fe
Received: from EX19D015EUB003.ant.amazon.com (10.252.51.113) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Thu, 28 Aug 2025 09:39:29 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB003.ant.amazon.com (10.252.51.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Thu, 28 Aug 2025 09:39:29 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.017; Thu, 28 Aug 2025 09:39:29 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
To: "david@redhat.com" <david@redhat.com>, "seanjc@google.com"
	<seanjc@google.com>
CC: "Roy, Patrick" <roypat@amazon.co.uk>, "tabba@google.com"
	<tabba@google.com>, "ackerleytng@google.com" <ackerleytng@google.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"rppt@kernel.org" <rppt@kernel.org>, "will@kernel.org" <will@kernel.org>,
	"vbabka@suse.cz" <vbabka@suse.cz>, "Cali, Marco" <xmarcalx@amazon.co.uk>,
	"Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "Thomson, Jack"
	<jackabt@amazon.co.uk>, "Manwaring, Derek" <derekmn@amazon.com>
Subject: [PATCH v5 10/12] KVM: selftests: cover GUEST_MEMFD_FLAG_NO_DIRECT_MAP
 in mem conversion tests
Thread-Topic: [PATCH v5 10/12] KVM: selftests: cover
 GUEST_MEMFD_FLAG_NO_DIRECT_MAP in mem conversion tests
Thread-Index: AQHcF/+mcpyXe48FIE+SGIUwj8fMnw==
Date: Thu, 28 Aug 2025 09:39:29 +0000
Message-ID: <20250828093902.2719-11-roypat@amazon.co.uk>
References: <20250828093902.2719-1-roypat@amazon.co.uk>
In-Reply-To: <20250828093902.2719-1-roypat@amazon.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_103935_947917_88B7DE70 
X-CRM114-Status: UNSURE (   7.79  )
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

Cover the scenario that the guest can fault in and write gmem-backed=0A=
guest memory even if its direct map removed.=0A=
=0A=
Signed-off-by: Patrick Roy <roypat@amazon.co.uk>=0A=
---=0A=
 .../selftests/kvm/x86/private_mem_conversions_test.c       | 7 ++++---=0A=
 1 file changed, 4 insertions(+), 3 deletions(-)=0A=
=0A=
diff --git a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c=
 b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c=0A=
index 82a8d88b5338..8427d9fbdb23 100644=0A=
--- a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c=0A=
+++ b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c=0A=
@@ -367,7 +367,7 @@ static void *__test_mem_conversions(void *__vcpu)=0A=
 }=0A=
 =0A=
 static void test_mem_conversions(enum vm_mem_backing_src_type src_type, ui=
nt32_t nr_vcpus,=0A=
-				 uint32_t nr_memslots)=0A=
+				 uint32_t nr_memslots, uint64_t gmem_flags)=0A=
 {=0A=
 	/*=0A=
 	 * Allocate enough memory so that each vCPU's chunk of memory can be=0A=
@@ -394,7 +394,7 @@ static void test_mem_conversions(enum vm_mem_backing_sr=
c_type src_type, uint32_t=0A=
 =0A=
 	vm_enable_cap(vm, KVM_CAP_EXIT_HYPERCALL, (1 << KVM_HC_MAP_GPA_RANGE));=
=0A=
 =0A=
-	memfd =3D vm_create_guest_memfd(vm, memfd_size, 0);=0A=
+	memfd =3D vm_create_guest_memfd(vm, memfd_size, gmem_flags);=0A=
 =0A=
 	for (i =3D 0; i < nr_memslots; i++)=0A=
 		vm_mem_add(vm, src_type, BASE_DATA_GPA + slot_size * i,=0A=
@@ -477,7 +477,8 @@ int main(int argc, char *argv[])=0A=
 		}=0A=
 	}=0A=
 =0A=
-	test_mem_conversions(src_type, nr_vcpus, nr_memslots);=0A=
+	test_mem_conversions(src_type, nr_vcpus, nr_memslots, 0);=0A=
+	test_mem_conversions(src_type, nr_vcpus, nr_memslots, GUEST_MEMFD_FLAG_NO=
_DIRECT_MAP);=0A=
 =0A=
 	return 0;=0A=
 }=0A=
-- =0A=
2.50.1=0A=
=0A=

