Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BF6CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 03:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qW+loHjVggbBFbzBCEdGIx8+uUjeaYhivWHjdhUVl44=; b=sWnj+64B20XcOoMG6hcu0dJ8jo
	M9ZHkpr400Pyg0NpNVRoo6hyERe0qBrPIBX1o4FTNFLrPLs1WlsZK6WW5arncn7Utk77vFN28FE6S
	Z9RGaBhxgivLz3kiLYcl5y+L1PgUu8EHH+xnkcXUH64/oV0csSZ71Poyf8c54le4pZ863xHhIkyLs
	tXu+kdnL8U3Bi4SaAHfB0CVpDgFzAVoIcVuRaGyRrVs9VZu7Ct1E1r9GcFvtKbuGGTiFIy9HKNMzz
	5lFTzimrX0Q/LJKs3BZ3ccxIUpXiLJM/s2eQLPCJ+Mj50/nTHt6an+jZkAYZpUGN7gre2O1HxnTMT
	CAVGi4PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPuK7-00000006aFz-0Xm1;
	Thu, 21 May 2026 03:43:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPuK3-00000006aEv-1QJO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 03:43:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9E4A1AED;
	Wed, 20 May 2026 20:43:37 -0700 (PDT)
Received: from [10.164.18.45] (unknown [10.164.18.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A68E13F85F;
	Wed, 20 May 2026 20:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779335022; bh=6TcRMwfis4amF8hlgBu1TnVMWK0DymCYZvWItZrVY8c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ifuY34r/c/+TzG6j/uZU5CI1IWVFjmJHz9txJipTfk8pal0u3VW+mW0/ur/rdCgKS
	 TK7NqHvY2UNW6IVIOPFB4jO1VPusc1aW/oiSj7XfSSokPXjG6KPZ+0Qf05gZebOJrt
	 E52V+rteRtWlfVb+wo/7dTryACOj++rfUMDb+LCY=
Message-ID: <1d694f9d-4f40-428b-aa28-9d6e0febd54c@arm.com>
Date: Thu, 21 May 2026 09:13:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V2 01/14] mm: Abstract printing of pxd_val()
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, Usama Arif <usama.arif@linux.dev>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260513044547.4128549-1-anshuman.khandual@arm.com>
 <20260513044547.4128549-2-anshuman.khandual@arm.com>
 <74f66e30-ab3d-4352-89ef-1bccc7e9daeb@intel.com>
 <b976ec4e-d5cb-4856-885d-dd301b3ddd83@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <b976ec4e-d5cb-4856-885d-dd301b3ddd83@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_204347_734158_79E0CFF9 
X-CRM114-Status: GOOD (  23.46  )
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

On 20/05/26 4:11 PM, David Hildenbrand (Arm) wrote:
> On 5/19/26 16:28, Dave Hansen wrote:
>> On 5/12/26 21:45, Anshuman Khandual wrote:
>>>  	if (!p4d_present(p4d) || p4d_leaf(p4d)) {
>>> -		pr_alert("pgd:%08llx p4d:%08llx\n", pgdv, p4dv);
>>> +		pr_alert("pgd:%" __PRIpxx " p4d:%" __PRIpxx "\n",
>>> +			 __PRIpxx_args(pgdv), __PRIpxx_args(p4dv));
>>>  		return;
>>>  	}
>>
>> That's not the most readable result. Could a printk() format specifier
>> make this nicer? Maybe use "%pT"?
>>
>> 	pr_alert("pgd:%pT p4d:%pT\n", &pgd, &p4d);
>>
>> I _think_ it could even get rid of the p??v variables.
> 
> That would be nicer indeed, if that works.

I had attempted something similar earlier.

https://lore.kernel.org/all/20250618041235.1716143-1-anshuman.khandual@arm.com/

But current proposal was to solve the problem with minimum possible churn
in generic MM to handle 128 bit page table entries for its value printing
purpose.

Please find an example WIP patch in this regard (tested very lightly). Please do
let me know if this is in the right direction and should be followed up instead.
Although special_hex_number() might have to support 128 bit values.

=====================================

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index c0b1b6089307..e69f91a9dd9d 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -696,6 +696,25 @@ Rust
 Only intended to be used from Rust code to format ``core::fmt::Arguments``.
 Do *not* use it from C.
 
+Page Table Entry
+----------------
+
+::
+
+        %p[pgd|p4dp|pud|pmd|pte]
+
+Print page table entry at any level.
+
+Passed by reference.
+
+Examples for a 64 bit page table entry, given &(u64)0xc0ffee::
+
+        %ppte   0x0000000000c0ffee
+        %ppmd   0x0000000000c0ffee
+        %ppud   0x0000000000c0ffee
+        %pp4d   0x0000000000c0ffee
+        %ppgd   0x0000000000c0ffee
+
 Thanks
 ======
 
diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
index bb70b9cddadd..ab7f55499eb7 100644
--- a/lib/tests/printf_kunit.c
+++ b/lib/tests/printf_kunit.c
@@ -791,6 +791,73 @@ errptr(struct kunit *kunittest)
 #endif
 }
 
+struct pxd_test {
+	u64 val;
+	const char *name;
+};
+
+static struct pxd_test pxd_test_cases[] = {
+	{ .val = 0xc0ffee,		.name = "0x0000000000c0ffee"},
+	{ .val = 0xdeadbeef,		.name = "0x00000000deadbeef"},
+	{ .val = 0xaabbcc,		.name = "0x0000000000aabbcc"},
+	{ .val = 0xcc,			.name = "0x00000000000000cc"},
+	{ .val = 0x1,			.name = "0x0000000000000001"},
+	{ .val = 0x11,			.name = "0x0000000000000011"},
+	{ .val = 0x111,			.name = "0x0000000000000111"},
+	{ .val = 0x10000010001,		.name = "0x0000010000010001"},
+	{ .val = 0xc0ffeec0ffee,	.name = "0x0000c0ffeec0ffee"},
+	{ .val = 0x10000000000,		.name = "0x0000010000000000"},
+	{ .val = 0x11000000000,		.name = "0x0000011000000000"},
+	{ .val = 0x1000000000000000,	.name = "0x1000000000000000"},
+	{ .val = 0x1100000000000000,	.name = "0x1100000000000000"},
+	{ .val = 0x1110000000000000,	.name = "0x1110000000000000"},
+};
+
+static void
+pxd(struct kunit *kunittest)
+{
+	char buf[64];
+	int i;
+
+	if (sizeof(pte_t) != 8)
+		kunit_skip(kunittest, "pte_t size is not 64 bits");
+
+	for (i = 0; i < ARRAY_SIZE(pxd_test_cases); i++) {
+		pte_t pte = __pte(pxd_test_cases[i].val);
+
+		snprintf(buf, sizeof(buf), "%ppte", &pte);
+		KUNIT_EXPECT_STREQ(kunittest, buf, pxd_test_cases[i].name);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(pxd_test_cases); i++) {
+		pmd_t pmd = __pmd(pxd_test_cases[i].val);
+
+		snprintf(buf, sizeof(buf), "%ppmd", &pmd);
+		KUNIT_EXPECT_STREQ(kunittest, buf, pxd_test_cases[i].name);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(pxd_test_cases); i++) {
+		pud_t pud = __pud(pxd_test_cases[i].val);
+
+		snprintf(buf, sizeof(buf), "%ppud", &pud);
+		KUNIT_EXPECT_STREQ(kunittest, buf, pxd_test_cases[i].name);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(pxd_test_cases); i++) {
+		p4d_t p4d = __p4d(pxd_test_cases[i].val);
+
+		snprintf(buf, sizeof(buf), "%pp4d", &p4d);
+		KUNIT_EXPECT_STREQ(kunittest, buf, pxd_test_cases[i].name);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(pxd_test_cases); i++) {
+		pgd_t pgd = __pgd(pxd_test_cases[i].val);
+
+		snprintf(buf, sizeof(buf), "%ppgd", &pgd);
+		KUNIT_EXPECT_STREQ(kunittest, buf, pxd_test_cases[i].name);
+	}
+}
+
 static int printf_suite_init(struct kunit_suite *suite)
 {
 	total_tests = 0;
@@ -839,6 +906,7 @@ static struct kunit_case printf_test_cases[] = {
 	KUNIT_CASE(errptr),
 	KUNIT_CASE(fwnode_pointer),
 	KUNIT_CASE(fourcc_pointer),
+	KUNIT_CASE(pxd),
 	{}
 };
 
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 9f359b31c8d1..937499c51ecd 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -856,6 +856,51 @@ static char *default_pointer(char *buf, char *end, const void *ptr,
 	return ptr_to_id(buf, end, ptr, spec);
 }
 
+static char *pxd_pointer(char *buf, char *end, const void *ptr,
+			 struct printf_spec spec, const char *fmt)
+{
+
+	if (check_pointer(&buf, end, ptr, spec))
+		return buf;
+
+	static_assert((sizeof(pte_t) == 4) || (sizeof(pte_t) == 8));
+	static_assert((sizeof(pmd_t) == 4) || (sizeof(pmd_t) == 8));
+	static_assert((sizeof(pud_t) == 4) || (sizeof(pud_t) == 8));
+	static_assert((sizeof(p4d_t) == 4) || (sizeof(p4d_t) == 8));
+	static_assert((sizeof(pgd_t) == 4) || (sizeof(pgd_t) == 8));
+
+	if (fmt[1] == 't' && fmt[2] == 'e') {
+		pte_t *pte = (pte_t *)ptr;
+
+		return special_hex_number(buf, end, pte_val(*pte), sizeof(pte_t));
+	}
+
+	if (fmt[1] == 'm' && fmt[2] == 'd') {
+		pmd_t *pmd = (pmd_t *)ptr;
+
+		return special_hex_number(buf, end, pmd_val(*pmd), sizeof(pmd_t));
+	}
+
+	if (fmt[1] == 'u' && fmt[2] == 'd') {
+		pud_t *pud = (pud_t *)ptr;
+
+		return special_hex_number(buf, end, pud_val(*pud), sizeof(pud_t));
+	}
+
+	if (fmt[1] == '4' && fmt[2] == 'd') {
+		p4d_t *p4d = (p4d_t *)ptr;
+
+		return special_hex_number(buf, end, p4d_val(*p4d), sizeof(p4d_t));
+	}
+
+	if (fmt[1] == 'g' && fmt[2] == 'd') {
+		pgd_t *pgd = (pgd_t *)ptr;
+
+		return special_hex_number(buf, end, pgd_val(*pgd), sizeof(pgd_t));
+	}
+	return default_pointer(buf, end, ptr, spec);
+}
+
 int kptr_restrict __read_mostly;
 
 static noinline_for_stack
@@ -2506,6 +2551,9 @@ early_param("no_hash_pointers", no_hash_pointers_enable);
  *		Without an option prints the full name of the node
  *		f full name
  *		P node name, including a possible unit address
+ * - 'p[g|4|u|m|t|][d|e]' For a page table entry, this prints its
+ *			  contents in a hexadecimal format
+ *
  * - 'x' For printing the address unmodified. Equivalent to "%lx".
  *       Please read the documentation (path below) before using!
  * - '[ku]s' For a BPF/tracing related format specifier, e.g. used out of
@@ -2615,6 +2663,8 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 		default:
 			return error_string(buf, end, "(einval)", spec);
 		}
+	case 'p':
+		return pxd_pointer(buf, end, ptr, spec, fmt);
 	default:
 		return default_pointer(buf, end, ptr, spec);
 	}
diff --git a/mm/memory.c b/mm/memory.c
index ea6568571131..838e06cc377d 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -521,7 +521,6 @@ static bool is_bad_page_map_ratelimited(void)
 
 static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long addr)
 {
-	unsigned long long pgdv, p4dv, pudv, pmdv;
 	p4d_t p4d, *p4dp;
 	pud_t pud, *pudp;
 	pmd_t pmd, *pmdp;
@@ -532,34 +531,30 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
 	 * see locking requirements for print_bad_page_map().
 	 */
 	pgdp = pgd_offset(mm, addr);
-	pgdv = pgd_val(*pgdp);
 
 	if (!pgd_present(*pgdp) || pgd_leaf(*pgdp)) {
-		pr_alert("pgd:%08llx\n", pgdv);
+		pr_alert("pgd:%ppgd\n", pgdp);
 		return;
 	}
 
 	p4dp = p4d_offset(pgdp, addr);
 	p4d = p4dp_get(p4dp);
-	p4dv = p4d_val(p4d);
 
 	if (!p4d_present(p4d) || p4d_leaf(p4d)) {
-		pr_alert("pgd:%08llx p4d:%08llx\n", pgdv, p4dv);
+		pr_alert("pgd:%ppgd p4d:%pp4d\n", pgdp, p4dp);
 		return;
 	}
 
 	pudp = pud_offset(p4dp, addr);
 	pud = pudp_get(pudp);
-	pudv = pud_val(pud);
 
 	if (!pud_present(pud) || pud_leaf(pud)) {
-		pr_alert("pgd:%08llx p4d:%08llx pud:%08llx\n", pgdv, p4dv, pudv);
+		pr_alert("pgd:%ppgd p4d:%pp4d pud:%ppud\n", pgdp, p4dp, pudp);
 		return;
 	}
 
 	pmdp = pmd_offset(pudp, addr);
 	pmd = pmdp_get(pmdp);
-	pmdv = pmd_val(pmd);
 
 	/*
 	 * Dumping the PTE would be nice, but it's tricky with CONFIG_HIGHPTE,
@@ -567,8 +562,8 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
 	 * doing another map would be bad. print_bad_page_map() should
 	 * already take care of printing the PTE.
 	 */
-	pr_alert("pgd:%08llx p4d:%08llx pud:%08llx pmd:%08llx\n", pgdv,
-		 p4dv, pudv, pmdv);
+	pr_alert("pgd:%ppgd p4d:%pp4d pud:%ppud pmd:%ppmd\n", pgdp,
+		 p4dp, pudp, pmdp);
 }
 
 /*
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 0492d6afc9a1..9dd17e501bfa 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6975,7 +6975,7 @@ sub process {
 				my $fmt = get_quoted_string($lines[$count - 1], raw_line($count, 0));
 				$fmt =~ s/%%//g;
 
-				while ($fmt =~ /(\%[\*\d\.]*p(\w)(\w*))/g) {
+				while ($fmt =~ /(\%[\*\d\.]*p(\w)(\w*)(\te)(\md)(\ud)(\4d)(\gd))/g) {
 					$specifier = $1;
 					$extension = $2;
 					$qualifier = $3;

